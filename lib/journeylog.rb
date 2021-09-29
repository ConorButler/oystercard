class JourneyLog
  attr_reader :journeys
  def initialize(journey_class = Journey.new)
    @journeys = []
    @journey_class = journey_class
  end

  def start(station)
    @journey_class.finish(nil) if !self.current_journey.entry_station.nil? 
    @journey_class.entry_station = station
    # starts a new journey with an entry station
  end

  def finish(station)
    @journey_class.exit_station = station
    @journeys << @journey_class.entry_station 
    @journeys << @journey_class.exit_station
    @journey_class = nil
  end

  private
  def current_journey
    @journey_class ? @journey_class : @journey_class = Journey.new
    # returns an incomplete journey or creates a new one
  end

end

# def touch_in(station, new_journey = Journey.new(station))
#   raise "You need the minimum fare balance of £#{MINIMUM_FARE}" if @balance < MINIMUM_FARE
#   end_journey(@active_journey, nil) if @active_journey
#   @active_journey = new_journey 
# end

# def touch_out(station, new_journey = Journey.new)
#   @active_journey = new_journey if @active_journey.nil?
#   end_journey(@active_journey, station)
#   @active_journey = nil
# end

# def end_journey(journey, exit_station)
#   @active_journey.finish(exit_station)
#   deduct(@active_journey.fare)
#   journey_log << @active_journey
# end