
describe "User Stories" do

  # In order to use public transport
  # As a customer
  # I want money on my card
  it "so customer can check balance, return balance on card" do
    card = Oystercard.new
    expect{card.balance}.not_to raise_error
  end

  it "so customer can add money to their card, top up the card" do
    card = Oystercard.new
    card.top_up(10)
    expect(card.balance).to eq 10
  end



end
