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
  end

  describe "#invalid_top_up?" do

    it "has the method" do
      expect(oystercard).to respond_to(:invalid_top_up?).with(1).argument
    end


    it "if top up will exceed 90 it will return true" do
      expect(oystercard.invalid_top_up?(95)).to eq(true)
    end

  end

  describe "#deduct" do

    it "should deduct amount specifed from balance" do
      oystercard.top_up(10)
      expect{oystercard.deduct(5)}.to change{oystercard.balance}.by -5
    end
  end

  describe "#in_journey" do
    it "should respond to to in_journey" do
      expect(oystercard).to respond_to(:in_journey)
    end
  end

  context 'when card has enough balance for the complete journey' do
    before do
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
    end
  end


end
