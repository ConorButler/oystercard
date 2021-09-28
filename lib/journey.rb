class Journey
  attr_reader :entry_station, :minimum_fare
  MINIMUM_FARE = 1

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
    @minimum_fare = MINIMUM_FARE
  end

  def complete?
    @entry_station.nil? || @exit_station.nil?
  end

  def finish(station)
    @exit_station = station
  end

  def fare
    2
  end

end