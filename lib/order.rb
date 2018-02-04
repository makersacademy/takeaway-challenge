require_relative 'menu'

class Order

  attr_reader :trolley, :menu

  def initialize
    @trolley ={}
    @menu = { Paella: 7,
           Rissotto: 8,
           Octopus: 15,
           Salad: 6,
           Wine: 4
            }
  end

  def add(dish, quantity)
    @trolley.merge!(dish.to_sym => quantity.to_i)
    print "Thank you. Your #{dish} dish was added #{quantity} times to your trolley"
  end

  def dish_price
    @trolley.map do |dish, quantity|
      price = quantity * @menu[:Paella]
      print "Total price of #{quantity} dishes of #{dish} : #{price} £"
    end
  end
end
