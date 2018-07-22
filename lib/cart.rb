require_relative 'menu'
require_relative 'send_sms'
require 'twilio-ruby'
require 'date'

class Cart

  def initialize(menu_class = Menu)
    @menu = menu_class.new
    @items = []
    @sms = TextSender.new
  end

  attr_reader :items

  def print_full_menu
    @menu.print_all
  end

  def print_category(category_name)
    @menu.print_category(category_name)
  end

  def add(item_name)
    if item_name.is_a? String
      add_or_update(item_name)
    elsif item_name.is_a? Array
      item_name.each do |string|
        add_or_update(string)
      end
    else
      fail "Please input either an item name or an array of item names"
    end
  end

  def remove(item_name)
    if item_name.is_a? String
      remove_or_update(item_name)
    elsif item_name.is_a? Array
      item_name.each do |string|
        remove_or_update(string)
      end
    else
      fail "Please input either an item name or an array of item names"
    end
  end

  def my_items
    puts ""
    puts "Your Cart".center(36)
    puts "-----------------------------------".center(36)
    @items.each do |item_hash|
      puts "#{item_hash[:quantity].to_s.ljust(3)}#{item_hash[:name].ljust(24)}: £#{sprintf('%.2f', (item_hash[:price] * item_hash[:quantity]))}"
    end
    puts "-----------------------------------".center(36)
    puts " ".ljust(3) + "Total Price".ljust(24) + ": £#{sprintf('%.2f', total)}"
    puts ""
  end

  def total
    total = 0
    @items.each do |item_hash|
      total += (item_hash[:price] * item_hash[:quantity])
    end
    total
  end

  def my_total
    puts "£#{sprintf('%.2f', total)}"
  end

  def checkout(confirmed_price)
    fail "That total was incorrect. Please input the total price of your order to confirm checkout" unless confirmed_price == total
    # puts "Thank you, your order has been placed! It should arrive before {delivery_time.strftime('%R')}"
    @sms.send_text
    @items = []
  end

  private

  def item_in_cart?(item_name)
    @items.each do |item|
      if item[:name] == item_name
        return true
      end
    end
  end

  def add_to_quantity(item_name)
    @items.each do |item|
      if item[:name] == item_name
        item[:quantity] += 1
      end
    end
  end

  def add_new_item(item_name)
    @menu.menu.each do |_category, array|
      array.each do |item|
        if item[:name] == item_name
          item_to_add = item
          item_to_add[:quantity] = 1
          @items.push(item_to_add)
        end
      end
    end
  end

  def add_or_update(item_name)
    if item_in_cart?(item_name) == true
      add_to_quantity(item_name)
    else
      add_new_item(item_name)
    end
  end

  def item_quantity_over_1?(item_name)
    @items.each do |item|
      if item[:name] == item_name
        return true if item[:quantity] > 1
      end
    end
  end

  def remove_from_quantity(item_name)
    @items.each do |item|
      if item[:name] == item_name
        item[:quantity] -= 1
      end
    end
  end

  def remove_item(item_name)
    @items.each do |item|
      if item[:name] == item_name
        @items.delete(item)
      end
    end
  end

  def remove_or_update(item_name)
    if item_quantity_over_1?(item_name) == true
      remove_from_quantity(item_name)
    else
      remove_item(item_name)
    end
  end

end
