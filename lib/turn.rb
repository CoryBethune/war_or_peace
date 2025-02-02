require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'
require 'pry'

class Turn

  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type

    if @player1.deck.cards.length < 3 || @player2.deck.cards.length < 3
      :draw

    else

      if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
        return :mutually_assured_destruction

      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
        return :war

      elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
        return :basic
      end

    end

  end

  def winner

      if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
        'No Winner'

      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)

        if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
          @player1
        else
          @player2
        end

      elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)

        if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
          @player1
        else
          @player2
        end

      end

    

  end

  def pile_cards #basic then mad then war

    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)

      @player1.deck.remove_card
      @player1.deck.remove_card
      @player1.deck.remove_card
      @player2.deck.remove_card
      @player2.deck.remove_card
      @player2.deck.remove_card


    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)

      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card

    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)

      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card


    end
  end

  def award_spoils(who_won)

    if who_won == 'No Winner'

    elsif who_won == :draw


    else

      @spoils_of_war.length.times do
        who_won.deck.cards << @spoils_of_war.pop
      end

      @spoils_of_war = []
    end
  end

  def winner_of_game

    if @player1.deck.cards.length > @player2.deck.cards.length
      @player1.name
    else
      @player2.name
    end

  end


end
