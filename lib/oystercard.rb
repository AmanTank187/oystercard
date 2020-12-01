class Oystercard

  attr_reader :balance
  BALANCE_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    fail "Can't exceed the limit of £#{BALANCE_LIMIT}" if @balance + amount > BALANCE_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    fail "Have insufficient funds" if @balance < MINIMUM_FARE
    @in_use = true
  end

  def touch_out
    deduct_fare(MINIMUM_FARE)
    
    @in_use = false
  end

  def in_journey?
    @in_use
  end

  private

  def deduct_fare(fare = MINIMUM_FARE)
    @balance -= fare
  end

end
