class Oystercard
  attr_reader :balance, :limit, :journey_log, :active_journey
  LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(journey_log = JourneyLog.new)
    @balance = 0
    @limit = LIMIT
    @journey_log = journey_log
  end

  def top_up(amount)
    raise "You cannot top up over the limit of £#{@limit}" if @balance + amount > @limit
    @balance += amount
  end

  def touch_in(station, journey = Journey.new)
    raise "You need the minimum fare balance of £#{MINIMUM_FARE}" if @balance < MINIMUM_FARE
    @journey_log.start(station)
  end

  def touch_out(station, new_journey = Journey.new)
    @journey_log.finish(station)
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end