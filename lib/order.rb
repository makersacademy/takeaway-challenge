require './lib/menu.rb'
require './lib/textprovider.rb'

class Order

  attr_reader :basket

  def initialize(menu)
    @basket = []
    @menu = menu
  end

  def select_dish(dish_num, quantity)
    @basket << { dish: @menu.dishes[dish_num - 1][:dish],
     total: @menu.dishes[dish_num - 1][:price] * quantity }
    puts "#{quantity}x #{@menu.dishes[dish_num - 1][:dish]}
     added to your basket"
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
    puts "£#{sum}"
    sum
  end

  def checkout(amount, textprovider = TextProvider.new)
    raise "Amount not correct" if incorrect_amount?(amount)
    textprovider.send_text
  end

  private

  def incorrect_amount?(amount)
    amount != total
  end

end
