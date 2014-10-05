class Card



  def initialize(suite,value)
    @suit = suite
    @value = value
  end
end

class deck


  def shuffle
  end



end

# class Picker
#   def picker
#   end
# end

class Card

   #attr_accessor

  #  suits = ["spades","diamonds","clubs","heart"]
  #   values = [1,2,3,4,5,6,7,8,9,10,11,12,13]

    def initialize(suit,value)
      @suit = suit
      @value = value

    end

end


class Player < Card


  d
end

class Dealer < Card
  def initialize
  end
  def hits
    #if true
    #dealer picks a card
  end
  def stay
    #if true
    #stay
  end
end

class Game > Card
  # Player gets two random cards from the array deck of cards
  #dealer gets two random cards - cards got by player
  # card count get populated in array hands

  def self.play
  end


end

class hand
  @@dealer_hand = []
  @@player_hand = []

end


suits = ["spades","diamonds","clubs","heart"]
values = [1,2,3,4,5,6,7,8,9,10,11,12,13]

suit_val = suits.sample
val_val = values.sample

c1 = Card.new(suit_val,val_val)

suit_val2 = suits.sample
val_val2 = values.sample



dealer


Game.play
