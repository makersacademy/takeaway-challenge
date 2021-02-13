require 'menu'

class TakeAway
  attr_reader :basket
  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
  end 

  def read_menu()
    @menu.dishes
  end 

  def add_to_basket(dish, quantity = 1)
    fail "#{dish} is not available" if @menu.dishes[dish] == nil
    @basket[dish] += quantity
  end

  def checkout(payment)
    fail "Incorrect amount" if !is_correct_amount?(payment)
  end

  def basket_total()
    total_price = 0
    @basket.each do |dish, quantity| 
      total_price += @menu.dishes[dish] * quantity
    end
    total_price
  end

  private 

  def is_correct_amount?(payment)
    basket_total() == payment 
  end

end 
