class Deck

  attr_reader :cards

  def initialize(array)
    @cards = array
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards(cards_array)
    high_card_array = []

    cards_array.each do |card|
      if card.rank >= 11
      high_card_array << card
    end

    return high_card_array
  end

  def percent_high_ranking
    high_card_count = 0

    @cards.each do |cards|
      if cards.rank >= 11
        high_card_count += 1
      end
    end

    return high_card_count / @cards.length

  end

  def remove_card
    @cards.shift
  end

  def add_card
    @cards.push
  end


end