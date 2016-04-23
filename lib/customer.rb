require_relative './menu'

class Customer

attr_reader :menu, :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def read_menu
    menu.list
  end

  def order(item:, quantity:)
    quantity.times do | times |
      @basket << menu.list.select { |k,v| k == item }
    end
  end
    #so we are given an item, which will be the same as one of the keys to menu.list. We take that item from the hash, and then add it quantity times to our order array.
    #hey no, let's introduce another step.
    # let's just make this method responsible for creating a hash of item: and quantity: key/value pairs. This can then be returned as the basket. when we check out, that's when we'll splice in the prices and check the total.




end