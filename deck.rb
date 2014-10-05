class Deck
  attr_accessor :cards
end

class Card
  def initialize(suite,value)
    @suit = suite
    @value = value
  end
end

a = Card.new(:hearts,2)
b = Card.new(:hearts,3)

deck = Deck.new
deck.cards = [a,b]

p deck.cards
