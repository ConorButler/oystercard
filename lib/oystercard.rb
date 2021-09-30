class Oystercard
  attr_reader :balance, :limit, :journey_log
  LIMIT = 90
  MINIMUM_FARE = 1
  PENALTY_FARE = 5

  def initialize(journey_log = JourneyLog.new)
    @balance = 0
    @limit = LIMIT
    @journey_log = journey_log
  end

  def top_up(amount)
    raise "You cannot top up over the limit of £#{@limit}" if @balance + amount > @limit
    @balance += amount
  end

  def touch_in(station)
    raise "You need the minimum fare balance of £#{MINIMUM_FARE}" if @balance < MINIMUM_FARE
    deduct(PENALTY_FARE) if @journey_log.outstanding_fare? # if they are currently touched in
    @journey_log.start(station)
  end

  def touch_out(station)
    @journey_log.finish(station)
    deduct(@journey_log.journeys.last.fare)
  end
  
  private
  def deduct(amount)
    @balance -= amount
  end

end