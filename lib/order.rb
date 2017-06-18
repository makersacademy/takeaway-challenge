require "./lib/menu.rb"

class Order

  attr_reader :menu, :basket
  attr_accessor :total

  def initialize
    @menu = Menu.new
    @basket = []
    @total = 0
  end

  def select_item(item_number, amount = 1)
    amount.times { @basket << @menu.menu[item_number - 1] }
  end

  def view_basket
    sort_basket
    calculate_total
    puts "your total amount is $#{@total} dollars"
  end

private

  def calculate_total
    @basket = @basket.map { |item| item[:price] }
    @total = @basket.reduce(:+)
  end

  def sort_basket
    @basket.each_with_index do |item, index|
      puts "#{index + 1}. #{item[:menu_item]} - $#{item[:price]}"
    end
  end
end
