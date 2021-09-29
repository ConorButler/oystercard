require 'Oystercard'

describe Oystercard do

  let(:paddington) { double("Paddington") }
  let(:baker_street) { double("Baker Street")}
  let(:started_journey) { double("Journey", :entry_station => "Paddington") }

  it "defaults to a balance of 0" do
    expect(subject.balance).to eq(0)
  end

  it "adds money to the card balance" do 
    subject.top_up(5)
    expect(subject.balance).to eq(5)
  end

  it 'prevents you from topping up beyond the maximum balance' do
    expect { subject.top_up(subject.limit + 1) 
    }.to raise_error "You cannot top up over the limit of £#{subject.limit}"
  end

  it "has en empty list of journeys on creation" do
    expect(subject.journey_log).to be_empty
  end

  it "prevents you from touching in unless the card's balance has enough for the minimum fare" do
    expect {subject.touch_in(paddington)
    }.to raise_error "You need the minimum fare balance of £1"
  end

  context "going on a journey" do
    before do
      subject.top_up(subject.limit)
      subject.touch_in(paddington)
    end

    it "deducts the minimum fee on touch out" do
      expect { subject.touch_out(baker_street) 
      }.to change{ subject.balance }.by(-1)
    end

    it "remembers the entry station after touch in" do
      subject.touch_in(paddington, started_journey)
      expect(subject.active_journey.entry_station).to eq("Paddington")
    end

    it "lets you touch out and end the journey" do
      subject.touch_out(baker_street)
      expect(subject.active_journey).to eq(nil)
    end
  end

  it "stores the previous journeys" do
    subject.top_up(50)
    subject.touch_in(paddington, started_journey)
    allow(started_journey).to receive(:finish).with(baker_street)
    allow(started_journey).to receive(:fare).and_return(1)
    subject.touch_out(baker_street)
    expect(subject.journey_log).to eq([started_journey]) # started journey is now finished
  end
  
end
