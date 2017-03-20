require "oystercard"

describe Oystercard do

  subject(:oystercard) {described_class.new}

  describe "#balance" do

    it "responds to #balance" do
      expect(oystercard).to respond_to(:balance)
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

end
