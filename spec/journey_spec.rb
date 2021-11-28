require 'journey'

MINIMUM_FARE = 1

describe Journey do
  let(:journey) { Journey.new("Paddington") }
  it "starts a journey" do
    expect(journey.entry_station).to eq("Paddington")
  end

  it "knows if the journey is complete" do
    expect(journey.complete?).to be(false)
  end

  # it "calculates the cost of a complete journey" do
  #   journey.exit_station = double("Bank")
  #   journey.fare
  #   expect(journey.fare).to eq(MINIMUM_FARE)
  # end

  context 'given an exit station' do

    let(:station) { double(:station)}
    let(:other_station) { double(:other_station)}


    def update_zones(entry_zone, exit_zone)
      allow(station).to receive(:zone).and_return(entry_zone)
      allow(other_station).to receive(:zone).and_return(exit_zone)
    end

    it "makes the fare depending on the number of zones crossed" do
      journey = Journey.new(station)
      journey.finish(other_station)
      update_zones(1, 5)
      expect(journey.fare).to eq(5)
    end
  end
end