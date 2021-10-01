require './lib/menu'

class Order

  attr_reader :items

  def initialize
    @items = []
    @dishes = Menu::DISHES
    @total = 0
  end

  # Order an item with quantity
  def order(item, quantity = 1)
    check_item(item)
    item_quant = [item, quantity]
    @items << item_quant
    calc_price
    puts "You have added #{quantity}x #{item} to your order."
    puts "Your subtotal is: £#{@total}"
  end

  # List current order with subtotal
  def list
    @items.each do |item|
      puts "#{item[1]}x #{item[0]}"
    end
      puts "Your total today is £#{@total}"
  end

  # Calculate subtotal of order
  def calc_price
    @items.each do |item|
      @dishes.each do |dish|
        if item[0] == dish.name
          @total += (dish.price * item[1])
        end
      end
    end
  end

  # Checks if input is actually on the menu
  def check_item(item)
    check_count = 0
    @dishes.each do |dish|
      if item == dish.name
        check_count += 1
      end
    end
    if check_count == 0
      raise('We are unable to find that item.')
    end
  end

  def complete_order
    sent_text("Thanks for your order: £#{@total}")
  end

  def send_text
    
  end

end