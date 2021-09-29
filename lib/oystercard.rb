class Oystercard
  attr_reader :balance, :limit, :journey_log, :active_journey
  LIMIT = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @limit = LIMIT
    @journey_log = []
  end

  def top_up(amount)
    raise "You cannot top up over the limit of £#{@limit}" if @balance + amount > @limit
    @balance += amount
  end

  def touch_in(station, new_journey = Journey.new(station))
    raise "You need the minimum fare balance of £#{MINIMUM_FARE}" if @balance < MINIMUM_FARE
    end_journey(@active_journey, nil) if @active_journey
    @active_journey = new_journey 
  end

  def touch_out(station, new_journey = Journey.new)
    @active_journey = new_journey if @active_journey.nil?
    end_journey(@active_journey, station)
    @active_journey = nil
  end

  def end_journey(journey, exit_station)
    @active_journey.finish(exit_station)
    deduct(@active_journey.fare)
    journey_log << @active_journey
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end