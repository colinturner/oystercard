# holding a card balance, tracking journies,
class Oystercard

  attr_reader :balance, :in_journey, :entry_station, :exit_station, :journeys

  MAX_BALANCE     = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 2

  def initialize
    @balance = 0
    @journeys = []
    # @entry_station = nil
    # @exit_station = nil
  end

  def top_up(amount)
    raise "Cannot top up card. Max deposit (#{MAX_BALANCE}) exceeded. Try Lower Amount" if invalid_top_up?(amount)
    self.balance += amount
  end


  def touch_in(entry_station)
    raise "Cannot start journey. Minimum balance required is £#{MINIMUM_BALANCE}" if low_balance?
    self.entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    self.exit_station = exit_station
    journeys << {:entry_station => entry_station, :exit_station => exit_station}
    puts "======"
      puts journeys
      puts "++++++"
    self.entry_station = nil
  end

  def in_journey?
    !!entry_station  # same as !entry_station.nil?
  end

  private
  attr_writer :balance, :in_journey, :entry_station, :exit_station

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
