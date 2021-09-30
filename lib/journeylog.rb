class JourneyLog
  
  def initialize(journey_class: Journey)
    @journeys = []
    @journey_class = journey_class
  end

  def journeys
    @journeys.dup
  end

  def outstanding_fare?
    @active_journey
  end

  def start(station)
    end_journey(@active_journey) if @active_journey # if they already touched in, end the journey
    @active_journey = @journey_class.new(station) # make a new journey regardless
  end

  def finish(station)
    @active_journey ||= @journey_class.new # if they haven't touched in, make a new journey
    end_journey(@active_journey, station) # end it regardless
    @active_journey = nil # journey is complete, reset
  end

  private
  
  def end_journey(journey, exit_station = nil) # if already touched in, exit station is nil
    @active_journey.exit_station = exit_station
    @active_journey.fare
    @journeys << @active_journey
  end

end
