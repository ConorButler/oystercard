class Journey
  attr_reader :entry_station, :exit_station, :cost, :finished
  MINIMUM_FARE = 1
  PENALTY_FARE = 5

  def initialize(entry_station = nil) # creating a new object starts the journey
    @entry_station = entry_station
    @exit_station = nil
    @cost = 0 # pushsed to journey_history
  end

  def complete?
    !@entry_station.nil? && !@exit_station.nil? # if one of these is nil, it's not complete
  end

  def finish(station)
    @exit_station = station
  end

  def fare
    complete? ? @cost =  MINIMUM_FARE : @cost = PENALTY_FARE
  end

end