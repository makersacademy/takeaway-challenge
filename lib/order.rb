require "./lib/menu.rb"

class Order

  attr_reader :menu, :basket, :total

  def initialize
    @menu = Menu.new
    @basket = []
    @total = 0
  end

  def select_item(item_number, amount = 1)
    amount.times { @basket << @menu.menu[item_number - 1] }
  end

  def view_basket
    @basket.each_with_index do |item, index|
      puts "#{index + 1}. #{item[:menu_item]} : $#{item[:price]}"
    end
  end
end
