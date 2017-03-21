class Oystercard

  attr_reader :balance, :in_journey

  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Cannot top up card. Max deposit (#{MAX_BALANCE}) exceeded. Try Lower Amount" if invalid_top_up?(amount)
    self.balance += 10
  end

  def invalid_top_up?(amount)
    MAX_BALANCE <= amount + balance
  end

  def deduct(amount)
    self.balance -= amount
  end

  def touch_in
    self.in_journey = true
  end

  def touch_out
    self.in_journey = false
  end

  def in_journey?
    in_journey
  end

  private
  attr_writer :balance, :in_journey

end
