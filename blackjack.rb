class Card
attr_accessor :suit, :number, :value
  def initialize(suit,number,value)
    @suit = suit
    @number = number
    @value = value
  end
end

class Deck
  attr_accessor :card_value, :card_suit, :card_number
  #attr_accessor :cards


  def initialize
  @cards = []
  @top_card = []
  suits = ["hearts","spades","clubs","diamonds"]
  numbers = [2,3,4,5,6,7,8,9]

  suits.each do |suit|
    numbers.each do |number|
      @cards << [suit,number,value = number]
    end
    @cards << [suit, "J",10]
    @cards << [suit, "Q",10]
    @cards << [suit, "K",10]
    @cards << [suit, "A",11]
    end
 #p @@cards
  end

def shuffle_cards
  @cards.shuffle!
  p @cards
end

def draw_card
  @top_card = @cards.shift

  puts "________________________"

  return Card.new(@top_card[0],@top_card[1],@top_card[2])

end

 def show_card
  p @top_card
 end

end

class Hand

  def initialize
    @cards = []
  end

  def add_card(c)
    @cards << c
  end

  def get_cards
    return @cards
  end

  def get_value
    sum = 0
    @cards.each do |card|
    sum += card.value
    end
  return sum
  end
end

class Game
#attr_accessor :p_card1,:p_card2,:d_card1,:d_card2
attr_accessor :deck
attr_accessor :game_over

  def initialize(deck)
    @deck = deck
    @game_over = false
  end
  def begin(player_hand, dealer_hand)
    puts "Your two cards are:"
    player_hand.add_card(deck.draw_card)
    deck.show_card
    player_hand.add_card(deck.draw_card)
    deck.show_card
    p "_____________________"
    puts "One of the dealer's card is:"
    dealer_hand.add_card(deck.draw_card)
    deck.show_card
    dealer_hand.add_card(deck.draw_card)
    puts "Your hand: #{player_hand.get_value}"
    if (player_hand.get_value > 21)
      p "You are busted"
      p "Player's cards are: #{player_hand.get_cards}"
      p "Dealer's cards are: #{dealer_hand.get_cards}"
      @game_over = true
    elsif (player_hand.get_value == 21)
      p "Black Jack ! You Win !"
      p "Player's cards are: #{player_hand.get_cards}"
      p "Dealer's cards are: #{dealer_hand.get_cards}"
      @game_over = true

    end
  end

def play(player_hand, dealer_hand)
  #game_over = false
  player_stays = false
  dealer_stays = false

  while !game_over do
    puts "Do you want to stay or hit ? (h/s)"
    case gets.chomp
    when "h"
        player_hand.add_card(deck.draw_card)
        deck.show_card
        if (player_hand.get_value > 21)
            p "You busted ! You lost "
            p " Player hand is #{player_hand.get_value}"
            @game_over = true
        elsif (player_hand.get_value == 21)
            p "Black Jack ! You win !!"
            @game_over = true
        else
            p "Now player hand is #{player_hand.get_value}"
            player_stays = true
            #p "Player stays"
        end
      when "s"
        player_stays = true
        p "player stays"
        if (dealer_stays == true)
          if (player_hand.get_value > dealer_hand.get_value)
            p "Player wins"
            p "Player's cards are: #{player_hand.get_cards.inspect}"
            p "Dealer's cards are: #{dealer_hand.get_cards}"
          elsif (player_hand.get_value == dealer_hand.get_value)
            p "Game tied !"
          else
            p "Dealer wins"
            p "Player's cards are: #{player_hand.get_cards}"
            p "Dealer's cards are: #{dealer_hand.get_cards}"
          end
          @game_over = true
        end
    end
    if (player_stays == true)
      if (dealer_hand.get_value < 16)
          dealer_hand.add_card(deck.draw_card)
          p "Now dealer hand is #{dealer_hand.get_value}"
          if (dealer_hand.get_value > 21)
              p "Dealer Busted ! Player wins !"
              p "Player's cards are: #{player_hand.get_cards}"
              p "Dealer's cards are: #{dealer_hand.get_cards}"
              @game_over = true
          elsif (dealer_hand.get_value == 21)
              p "Black Jack for Dealer. Dealer Wins ! "
              p "Player's cards are: #{player_hand.get_cards}"
              p "Dealer's cards are: #{dealer_hand.get_cards}"
              @game_over = true
          else
              dealer_stays = true
              p "Dealer stays"
          end
      else
            dealer_stays = true
            #p "dealer stays"
      end
  end
end
end
end

print "Want to play BlackJack ? (y/n) :"
#print prompt
yes = gets.chomp
if (yes == "y")
deck = Deck.new
#card = Card.new
else
  p "Sorry..You don't have a choice !"
end
deck.shuffle_cards
p "_____________________"
p "Cards shuffled !"
p "Press p to play the game :"
p = gets.chomp

player_hand = Hand.new
dealer_hand = Hand.new
if (p == "p")
  game = Game.new(deck)

  game.begin(player_hand, dealer_hand)
end
if !game.game_over
game.play(player_hand, dealer_hand)
end

#game = Game.new()
