require './lib/menu'
require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Order

  # include SendText

  attr_reader :items, :total, :list

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
    if check_count.zero?
      false
      raise('We are unable to find that item.')
    else
      true
    end
  end

  def complete_order
    @items.empty? ? "There are no items in your basket." : send_text
  end

  def send_text
    @time = (Time.new + 3600).strftime("%k:%M")
    Twilio::REST::Client.new(ENV['TWIL_ACC'], ENV['TWIL_AUTH'])
      .messages.create(
        from: ENV['FROM_NUM'],
        to: ENV['TO_NUM'],
        body: message
      )
    puts message
  end

  def message
    "Thank you!\n\nYour order is £#{@total}.\n\nIt will be delivered before #{@time}!"
  end

end
