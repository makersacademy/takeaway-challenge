require './lib/menu'

class TakeAway

attr_accessor :menu, :basket, :total

  def initialize
    @menu = Menu.new
    @basket = []
    @total = 0
  end


  def add_item_to_basket(item, quantity = 1)
    #check the item exists
    @menu.dishes.each do |dish| #is a dish obj
      if item == dish.name
        quantity.to_i.times do
        @basket << dish
        basket_summary
        end
      end
    end
  end

  def check_basket_sub_total
    @basket.each do |dish|
      @total += dish.price
    end
    return "The total is £#{@total}."
  end

  def empty_basket
    @basket = []
  end

  def order_checkout
    return "Thank you for your order. The total is £#{total}."
  end

  private

  def basket_summary
    @basket.each do |dish|
      return "you have ordered #{dish.name}  = £#{dish.price}"
    end
  end
end
