require "oystercard"

describe Oystercard do

  subject(:oystercard) {described_class.new}

  describe '#initialization' do
    it 'should initialize card as not in a journey' do
      expect(oystercard.in_journey?).to eq false
    end
    it "new card has zero balance" do
      expect(oystercard.balance).to eq(0)
    end
  end

  describe "#top_up" do

    it 'can top up with given amount of money' do
      expect(oystercard).to respond_to(:top_up).with(1).argument
    end

    it "cannot top up if new balance exceeds 90" do
      max_balance = Oystercard::MAX_BALANCE
      message = "Cannot top up card. Max deposit (#{max_balance}) exceeded. Try Lower Amount"
      expect{ oystercard.top_up(95) }.to raise_error message
    end

  end


  describe "#in_journey" do
    it "should respond to to in_journey" do
      expect(oystercard).to respond_to(:in_journey)
    end
  end

  context 'when card has enough balance for the complete journey' do
    before do
      oystercard.top_up(10)
      oystercard.touch_in
    end

    describe "#touch_in" do
      it "should respond to touch_in" do
        expect(oystercard).to be_in_journey
      end
    end

    describe "#touch_out" do
      it 'should respond to touch_out' do
        oystercard.touch_out
        expect(oystercard).not_to be_in_journey
      end

      it 'should deduct the correct amount' do
        min_fare = Oystercard::MINIMUM_FARE
        expect{ oystercard.touch_out }.to change {oystercard.balance}.by -min_fare
      end
    end
  end

  context 'when card hase a balance of 0' do
    describe  "#touch_in" do
      it "restricts start of journey if minimum balance not met" do
        min_balance = Oystercard::MINIMUM_BALANCE
        expect{oystercard.touch_in}.to raise_error "Cannot start journey. Minimum balance required is £#{min_balance}"
      end
    end
  end

end
