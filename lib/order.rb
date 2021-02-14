require_relative 'text' 

class Order

  attr_reader :items, :total

  def initialize(user, formatorder = FormatOrder)
    @user = user
    @items = {}
    @total = 0.0
    @formatorder = formatorder
  end

  def add(item, quantity)
    return "Item number is not on the menu" if item == nil
    in_order?(item) ? @items[item] += quantity : @items[item] = quantity
    @total += item.price.to_f * quantity
  end

  def remove(item, quantity)
    raise "Item not in order" unless in_order?(item)
    raise "Can't remove more items than are in the order" if quantity_in_order?(item, quantity)
    
    @items[item] == quantity ? @items.delete(item) : @items[item] -= quantity
    @total -= item.price.to_f * quantity
  end

  def print_order
    raise "No items have been added to the order yet" if @items.empty?
    
    puts @formatorder.new(@items, @total).lines
  end

  def complete
    Text.new(@user)
  end

  private

  def in_order?(item)
    @items.keys.include?(item)
  end

  def quantity_in_order?(item, quantity)
    @items[item] < quantity
  end

end
