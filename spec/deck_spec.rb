require 'rspec'
require './lib/deck'
require './lib/card'


card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)
card_array = [card1, card2, card3]
deck2 = Deck.new(card_array)

RSpec.describe Deck do
  it 'exists' do
    deck = Deck.new(card_array)

    expect(deck).to be_an_instance_of(Deck)
  end

  it 'gets the card rank' do
    expect(deck2.rank_of_card_at(0)).to eq(12)
  end

  it 'shows the high ranking cards' do
    expect(deck2.high_ranking_cards).to eq([card1, card3])
  end

  it 'calcs percentage of high ranking cards' do
    expect(deck2.percent_high_ranking).to eq(66.67)
  end

  it 'removes a card' do
    test = deck2.remove_card

    expect(test.rank).to eq(@rank=12)
    expect(test.suit).to eq(@suit=:diamond)
    expect(test.value).to eq(@value="Queen")
  end

  it 'adds a card' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card_array = [card1, card2, card3]
    deck2 = Deck.new(card_array)
    card4 = Card.new(:club, '5', 5)
    deck2.add_card(card4)

    expect(deck2.cards).to eq([card1, card2, card3, card4])
  end


end
