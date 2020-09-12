require_relative 'menu'

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
    @items.each do |item0|
      #p item0[:name]
      #p item
      if item0[:name] == item
        if item0[:quantity] < quantity
          quantity = item0[:quantity]
        end
      end
    end

    decrease_quantity(item, quantity)
    remove_zero_quantity
    decrease_total(item, quantity)
  end

  def check_sum
    bill = 0
    @items.each do |item|
      @menu.menu_list.each do |dish|
        bill += dish[:price] * item[:quantity] if dish[:name] == item[:name]
      end
    end
    puts @total
    puts bill
    @total == bill
  end

  private 

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
  