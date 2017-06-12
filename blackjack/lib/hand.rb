require_relative 'deck'

class Hand
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_reader :points
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
    @points = 0
  end

  def points
    @points = 0
    
    @cards.each do |card|
      @points += (card.value == :ace ? 11 : card.blackjack_value)
    end

    if @points > 21 && @cards.any? { |card| card.value == :ace }
      @points -= 10 until @points <= 21
    end

    @points
  end

  def busted?
    points > 21
  end

  def hit(deck)
    raise "already busted" if busted?
    @cards += deck.take(1)
  end

  def beats?(other_hand)
    return false if busted?
    points > other_hand.points || other_hand.busted?
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
