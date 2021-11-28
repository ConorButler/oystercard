require 'journeylog'
require 'journey'
require 'oystercard'

 describe JourneyLog do
  
  # let(:journey){ double :journey } #this may need to have some methods
  # let(:station){ double :station }
  # let(:journey_class){double :journey_class, new: journey}
  # subject {described_class.new(journey_class: journey_class)}
  # it 'starts a journey' do
  #   expect(journey_class).to receive(:new).with(entry_station: station)
  #   subject.start(station)
  # end
  


  # ########################
  let(:bank) { double :bank }
  let(:marble_arch) { double :marble_arch}
  let(:paddington) { double :paddington }

  oyster = Oystercard.new
  oyster.top_up(90)

  it "returns and array with entry and exit station" do
    allow(paddington).to receive(:zone).and_return(1)
    allow(bank).to receive(:zone).and_return(1)
    oyster.touch_in(paddington)
    oyster.touch_out(bank)
    expect(oyster.journey_log.journeys[0].entry_station).to eq(paddington)
    expect(oyster.journey_log.journeys[0].exit_station).to eq(bank)
  end

  it "Saves the journey if they just touch out" do
    allow(marble_arch).to receive(:zone).and_return(1)
    oyster.touch_out(marble_arch)
    expect(oyster.journey_log.journeys[1].entry_station).to eq(nil)
    expect(oyster.journey_log.journeys[1].exit_station).to eq(marble_arch)
  end

  it "Saves the journey and starts another if they touch in twice" do
    allow(paddington).to receive(:zone).and_return(1)
    oyster.touch_in(paddington)
    oyster.touch_in(paddington)
    expect(oyster.journey_log.journeys[2].entry_station).to eq(paddington)
    expect(oyster.journey_log.journeys[2].exit_station).to eq(nil)
  end
end