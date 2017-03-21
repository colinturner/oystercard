# holding a card balance, tracking journies,
class Oystercard

  attr_reader :balance, :in_journey

  MAX_BALANCE     = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 2

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Cannot top up card. Max deposit (#{MAX_BALANCE}) exceeded. Try Lower Amount" if invalid_top_up?(amount)
    self.balance += 10
  end


  def touch_in
    raise "Cannot start journey. Minimum balance required is £#{MINIMUM_BALANCE}" if low_balance?
    self.in_journey = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    self.in_journey = false
  end

  def in_journey?
    in_journey
  end

  private
  attr_writer :balance, :in_journey

  def low_balance?
    balance < 1
  end

  def invalid_top_up?(amount)
    MAX_BALANCE <= amount + balance
  end

  def deduct(amount)
    self.balance -= amount
  end

end
