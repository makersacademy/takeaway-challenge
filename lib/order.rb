require_relative 'menu'
require_relative 'text'

class Order

  attr_reader :items, :total
   
  def initialize(menu_class = Menu)
    @items = []
    @total = 0
    @menu = menu_class.new
  end
  
  def add_item(item, quantity = 1)
    item_in_order?(item) ? increase_quantity(item, quantity) : add_new_item(item, quantity)
    increase_total(item, quantity)
  end

  def remove_item(item, quantity = 1)
    item_in_order?(item) ? quantity = quantity_validator(item, quantity) : quantity = 0
    decrease_quantity(item, quantity)
    remove_zero_quantity
    decrease_total(item, quantity)
  end

  def check_sum
    @total == create_bill
  end

  def place_order(total = @total, items = @items, text_class = Text)
    check_sum ? text_class.new(items, total) : "The total does not match the bill"
  end

  private 

  def quantity_validator(item, quantity)
    @items.each do |item0|
      if item0[:name] == item
        quantity = item0[:quantity] if item0[:quantity] < quantity
      end
    end
    quantity
  end

  def create_bill
    bill = 0
    @items.each do |item|
      @menu.menu_list.each do |dish|
        bill += dish[:price] * item[:quantity] if dish[:name] == item[:name]
      end
    end
    bill
  end

  def increase_quantity(item, quantity)
    @items.each do |dish|
      dish[:quantity] += quantity if item == dish[:name]
    end
  end

  def decrease_quantity(item, quantity)
    @items.each do |dish|
      dish[:quantity] -= quantity if item == dish[:name]
    end
  end

  def increase_total(item, quantity)
    @menu.menu_list.each do |dish|
      @total += (dish[:price] * quantity) if item == dish[:name]
    end
  end

  def decrease_total(item, quantity)
    @menu.menu_list.each do |dish|
      @total -= (dish[:price] * quantity) if item == dish[:name]
    end
  end

  def add_new_item(item, quantity)
    @menu.menu_list.each do |dish|
      @items << { name: item, quantity: quantity } if item == dish[:name]
    end
  end

  def item_in_order?(item)
    @items.find { |dish| dish[:name] == item }
  end

  def remove_zero_quantity
    @items.delete_if { |dish| dish[:quantity] < 1 }
  end
end
  