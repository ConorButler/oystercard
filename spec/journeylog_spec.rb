require 'journeylog'
require 'journey'
require 'oystercard'

 describe JourneyLog do
  let(:journey) { double :journey }
  let(:journey_class) { double :journey_class, new: journey }


  # let(:oyster) { double("Oyster", :balance => 90, :journey_log => subject) }
  let(:paddington) { double :paddington }
  let(:bank) { double :bank }
  let(:marble_arch) { double :marble_arch}

  subject {described_class.new(journey_class: journey_class)}

  oyster = Oystercard.new
  oyster.top_up(90)

  it "returns and array with entry and exit station" do
    oyster.touch_in(paddington)
    oyster.touch_out(bank)
    expect(oyster.journey_log.journeys[0].entry_station).to eq(paddington)
    expect(oyster.journey_log.journeys[0].exit_station).to eq(bank)
  end

  it "Saves the journey if they just touch out" do
    oyster.touch_out(marble_arch)
    expect(oyster.journey_log.journeys[1].entry_station).to eq(nil)
    expect(oyster.journey_log.journeys[1].exit_station).to eq(marble_arch)
  end

  it "Saves the journey and starts another if they touch in twice" do
    oyster.touch_in(paddington)
    oyster.touch_in(paddington)
    expect(oyster.journey_log.journeys[2].entry_station).to eq(paddington)
    expect(oyster.journey_log.journeys[2].exit_station).to eq(nil)
  end
end