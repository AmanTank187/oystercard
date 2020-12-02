class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys

  BALANCE_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_use = false
    @journeys = Hash.new 
  end

  def top_up(amount)
    raise "Can't exceed the limit of £#{BALANCE_LIMIT}" if @balance + amount > BALANCE_LIMIT

    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(station)
    raise 'Have insufficient funds' if @balance < MINIMUM_FARE

    @entry_station = station
  end

  def touch_out(station)
    deduct_fare(MINIMUM_FARE)
    @entry_station = nil
    @exit_station = station
  end

  def in_journey?
    !!entry_station
  end

  def show_journey
    
  end

  private

  def deduct_fare(fare = MINIMUM_FARE)
    @balance -= fare
  end
end
