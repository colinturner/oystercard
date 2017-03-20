class Oystercard

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    self.balance += 10
  end

  private
  attr_writer :balance


end
