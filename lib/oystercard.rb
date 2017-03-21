class Oystercard

  attr_reader :balance

  MAX_BALANCE = 90

  def initialize
    @balance = 0
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

  private
  attr_writer :balance


end
