require './lib/menu.rb'
require './lib/textprovider.rb'

class Order
  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
  end

  def select_dish(dish_num, quantity)
    @basket << { dish: @menu.dishes[dish_num - 1][:dish],
     total: @menu.dishes[dish_num - 1][:price] * quantity }
    puts "#{quantity}x #{@menu.dishes[dish_num - 1][:dish]} added to your basket"
    @basket
  end

  def basket_summary
    @basket.each do |hash|
      puts "#{hash[:dish]}, £#{hash[:total]}"
    end
  end

  def total
    sum = 0
    @basket.each do |hash|
      sum += hash[:total]
    end
    puts "Your total bill is £#{sum}"
    sum
  end

  def checkout(amount, textprovider = TextProvider.new)
    raise "Amount not correct" unless correct_amount?(amount)
    textprovider.send_text
  end

  private

  def correct_amount?(amount)
    amount == total
  end

end
