require './lib/menu.rb'
require './lib/textprovider.rb'

class Order
  def initialize(menu = Menu.new)
    @basket = {}
    @menu = menu
  end

  def select_dish(dish_num, quantity)
    @basket[dish_name(dish_num)] = {quantity: quantity, subtotal: subtotal(dish_num, quantity)}
  end

  def basket_summary
    @basket.each do |key, value|
      puts "#{value[:quantity]} x #{key}, £#{value[:subtotal]}"
    end
  end

  def total_bill
    sum = 0
    @basket.each {|key, value| sum += value[:subtotal] }
    return sum
  end

  def checkout(amount, textprovider = TextProvider.new)
    raise "Amount not correct" unless correct_amount?(amount)
    textprovider.send_text
  end

  private

  def subtotal(dish_num, quantity)
    quantity * @menu.dishes[dish_num][:price]
  end

  def dish_name(dish_num)
    @menu.dishes[dish_num][:dish]
  end

  def correct_amount?(amount)
    amount == total_bill
  end
end
