# require 'journey'

# MINIMUM_FARE = 1

# describe Journey do
#   let(:journey) { Journey.new("Paddington") }
#   it "starts a journey" do
#     expect(journey.entry_station).to eq("Paddington")
#   end

#   it "knows if the journey is complete" do
#     expect(journey.complete?).to be(false)
#   end

#   it "finishes a journey" do
#     journey.finish("Marble Arch")
#     expect(journey.complete?).to be(true)
#   end

#   it "calculates the cost of a complete journey" do
#     journey.finish("Marble Arch")
#     journey.fare
#     expect(journey.cost).to eq(MINIMUM_FARE)
#   end
# end