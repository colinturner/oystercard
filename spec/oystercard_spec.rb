require "oystercard"

describe Oystercard do

  subject(:oystercard) {described_class.new}

  it "responds to #balance" do
    expect(oystercard).to respond_to(:balance)
  end

  it "new card has zero balance" do
    expect(oystercard.balance).to eq(0)
  end

  it 'can top up with given amount of money' do
    expect(oystercard).to respond_to(:top_up).with(1).argument
  end

end
