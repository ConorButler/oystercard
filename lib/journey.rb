class Journey
  attr_accessor :entry_station, :exit_station
  MINIMUM_FARE = 1
  PENALTY_FARE = 5

  def initialize(entry_station = nil) # if they just touch out, entry station is nil
    @entry_station = entry_station
    @exit_station = nil
    @cost = 0 # pushed to journey_history
  end

  def complete?
    !@entry_station.nil? && !@exit_station.nil? # if one of these is nil, it's not complete
  end

  def fare
    complete? ? @cost =  MINIMUM_FARE : @cost = PENALTY_FARE
  end

end