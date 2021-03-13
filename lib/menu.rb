require 'csv'

class Menu 

  attr_reader :menu_list, :order_list, :order_total

  def initialize
    @menu_list = load_menu_items
    @order_list = []
    @order_total = 0
  end

  def load_menu_items
    @menu_list = CSV.open('./lib/menu_items.csv', headers: :first_row, 
    header_converters: :symbol, converters: :all).map(&:to_h)
  end

  def search_menu_items(input)
    @menu_list.find { |dish| dish[:number] || dish[:name] == input }
  end

  def add_to_order
    loop do
      @order_list << order_entry
      puts "Is your order complete?"
      if $stdin.gets.chomp.downcase == "y"
        return @order_list
      end
    end
  end

  def order_entry
    loop do 
      puts "Please enter the dish number or name to add to order:"
      dish = input_check($stdin.gets.chomp)
      puts "You have chosen #{dish} is this correct?"
      if $stdin.gets.chomp.downcase == "y"
        return search_menu_items(dish)
      end
    end
  end

  def input_check(input)
    input =~ /\d/ ? input.to_i : input.downcase.capitalize
  end

  def order_total_update
    @order_total = @order_list.sum { |hash| hash[:price] }
  end
end
