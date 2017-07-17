require './lib/confirmer.rb'

class Order

  attr_accessor :items, :item, :cost, :confirmer, :expected_total
  attr_reader :menu

  def initialize(items = [])
    @items = items
    @menu = Menu.new
    @expected_total = 0
  end

  def select_items
    puts "What menu item would you like? (Press return if you've finished ordering)"
      @item = gets.chomp.downcase
      until @item == ""
        puts "How many?"
        number = gets.chomp.to_i
        number.times { items << @item }
        select_items
      end
        puts "Write expected amount"
        @expected_total = gets.chomp.to_i
        check_price
  end

  def check_price
    sum_items
    fail 'Incorrect total, please start again' if @confirmer.cost != @expected_total
  end

  def sum_items
    @confirmer = Confirmer.new(items.group_by(&:itself).map{|k, v| [k, v.count]}.to_h)
    items.each do |item|
      @confirmer.cost += menu.items[item]
    end
  end

  def summarize_order
    @confirmer.display_order
  end
end
