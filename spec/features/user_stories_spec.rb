
describe "User Stories" do

  # In order to use public transport
  # As a customer
  # I want money on my card
  it "so customer can check balance, return balance on card" do
    card = Oystercard.new
    expect{card.balance}.not_to raise_error
  end

  # In order to keep using public transport
  # As a customer
  # I want to add money to my card

  it "so customer can add money to their card, top up the card" do
    card = Oystercard.new
    card.top_up(10)
    expect(card.balance).to eq 10
  end

  # In order to protect my money from theft or loss
  # As a customer
  # I want a maximum limit (of £90) on my card

  it "so customer can't load too much money on their card, limit maximum balance" do
    card = Oystercard.new
    max_balance = Oystercard::MAX_BALANCE
    expect { card.top_up(max_balance + 5) }.to raise_error("Cannot top up card. Max deposit (#{max_balance}) exceeded. Try Lower Amount")

  end

# In order to pay for my journey
# As a customer
# I need my fare deducted from my card

  it "so customer can spend balance, deduct money from card" do
    card = Oystercard.new
    card.top_up(10)
    expect(card.deduct(5)).to eq 5
  end


end
