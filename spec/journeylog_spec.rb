require 'journeylog'

 describe JourneyLog do
   it " returns and array with entry and exit station" do
    oyster = Oystercard.new
    oyster.top_up(80)
    oyster.touch_in("Paddington")
    oyster.touch_out("Liverpool st")
    expect(oyster.journey_log.journeys).to eq(["Paddington", "Liverpool st"])
   end

   it "Saves the journey if they just touch out" do
    oyster = Oystercard.new
    oyster.top_up(80)
    oyster.touch_out("Liverpool st")
    expect(oyster.journey_log.journeys).to eq([nil, "Liverpool st"])
   end

   it "Saves the journey if they just touch out" do
    oyster = Oystercard.new
    oyster.top_up(80)
    oyster.touch_in("Liverpool st")
    oyster.touch_in("neh")
    expect(oyster.journey_log.journeys).to eq(["Liverpool st", nil])
  end
end