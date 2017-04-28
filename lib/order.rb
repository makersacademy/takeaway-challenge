# Allows user to make their selection
class Order
  attr_accessor :customer_order, :selection, :quantity

  def initialize
    @customer_order = []
  end

  def take_order
    select_item
    select_item_quantity
    @customer_order << [@selection, @quantity]
    clear_current_choices
  end

  def select_item
    puts "Please select the item you want by its code"
    @selection = $stdin.gets.chomp
    raise "Selection cancelled" unless selection == "a" || selection == "b" || selection == "c"
  end

  def select_item_quantity
    puts "Please specify the quantity you'd like"
    @quantity = $stdin.gets.chomp.to_i
    raise "Selection cancelled" if quantity.zero?
  end

  def clear_current_choices
    @selection = nil
    @quantity = nil
  end

end
