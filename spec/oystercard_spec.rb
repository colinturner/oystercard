require "oystercard"

describe Oystercard do

  subject(:oystercard) {described_class.new}

  it "responds to #balance" do
    expect(oystercard).to respond_to(:balance)
  end

  it "new card has zero balance" do
    expect(oystercard.balance).to eq(0)
  end

end
