require_relative 'menu'

class Order

  attr_reader :menu, :selection, :order_price, :order_total, :ordered_selection

  def initialize(menu = Menu.new)
    @menu = menu
    @selection = []
    @order_price = 0
  end

  def show_menu
    @menu.see_menu
  end

  def select_item(item_number)
    @selection << @menu.menu[item_number - 1]
  end

  def order_summary
    show_order
    total_price
    print_total
  end

  def correct_total?
    @selection.map{|item| item[:price]}.inject(:+).round(2) == @order_price
  end

  private

  def sort_order
    @selection = @selection.sort_by {|item| item[:num]}
    @ordered_selection = @selection.each_with_object(Hash.new(0)) { |item,counts| counts[item] += 1 }
  end

  def show_order
    sort_order
    @ordered_selection.to_a.each {|item,count| puts "#{count} x #{item[:name]} : #{item[:price]}" }
  end

  def total_price
    @order_price = @selection.map{|item| item[:price]}.inject(:+).round(2)
  end

  def print_total
    puts "Your order total is £#{@order_price}"
  end
end
