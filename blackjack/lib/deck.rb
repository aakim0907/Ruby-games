require_relative 'card'

class Deck
  def self.all_cards
    cards = []
    Card.suits.each do |suit|
      Card.values.each do |val|
        cards << Card.new(suit, val)
      end
    end
    cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def take(n)
    raise 'not enough cards' if n > count
    @cards.shift(n)
  end

  def return(cards)
    @cards += cards
  end
end
