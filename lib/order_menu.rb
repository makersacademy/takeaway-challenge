require 'terminal-table'
require 'csv'

class OrderMenu 

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
    @menu_list.find { |dish| dish[:number] == input || dish[:name] == input }
  end

  def add_to_order
    loop do
      @order_list << order_entry
      puts "Is your order complete?"
      if confirmation?
        return @order_list
      end
    end
  end

  def order_entry
    loop do 
      puts "Please enter the dish number or name to add to order:"
      dish = input_check($stdin.gets.chomp)
      redo if dish == false
      puts "You have chosen #{dish} is this correct?"
      if confirmation?
        return search_menu_items(dish)
      end
    end
  end

  def input_check(input)
    dish = input =~ /\d/ ? input.to_i : input.downcase.capitalize
    search_menu_items(dish) ? dish : false
  end

  def order_total_update
    @order_total = @order_list.sum { |hash| hash[:price] }
  end

  def update_recipt
    CSV.open('./lib/order_list.csv', "wb") do |csv|
      csv << @order_list.first.keys 
      @order_list.each do |hash|
        csv << hash.values
      end
    end
  end

  def order_recipt
    update_recipt
    recipt_array = CSV.read('./lib/order_list.csv').to_a
    recipt_table = Terminal::Table.new do |v|
      v.headings = recipt_array[0]
      v.rows = recipt_array[1..]
    end
    recipt_table.style = { :alignment => :center }
    puts recipt_table
  end

  def confirmation?
    $stdin.gets.chomp.downcase == "y"
  end
end
