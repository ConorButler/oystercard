class Oystercard
  attr_reader :balance, :limit, :minimum_fare, :entry_station, :exit_station, :journey_history
  LIMIT = 90

  def initialize
    @balance = 10
    @limit = LIMIT
    @journey_history = []
    @journey = nil
  end

  def top_up(amount)
    raise "You cannot top_up over the limit of £#{@limit}" if @balance + amount > @limit
    @balance += amount
  end

  def touch_in(station, journey = Journey.new(station))
    raise "You need the minimum fare balance" if @balance < 1
    end_journey(@journey, nil) if !@journey.nil?
    @journey = journey
  end

  def touch_out(station, journey = Journey.new)
    !@journey.nil? ? @journey : @journey = journey
    end_journey(@journey, station)
    @journey = nil
  end

  def end_journey(journey, station)
    journey.finish(station)
    deduct(journey.fare)
    journey_history << journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end