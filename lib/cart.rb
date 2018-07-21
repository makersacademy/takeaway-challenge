require_relative 'menu'
require 'date'

class Cart

  def initialize(menu_class = Menu)
    @menu = menu_class.new
    @items = []
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
      @menu.menu.each do |category, array|
        array.each do |item|
          if item[:name] == item_name
            @items.push(item)
          end
        end
      end
    elsif item_name.is_a? Array
      item_name.each do |string|
        @menu.menu.each do |category, array|
          array.each do |item|
            if item[:name] == string
              @items.push(item)
            end
          end
        end
      end
    else
      fail "Please input either an item name or an array of item names"
    end
  end

  def remove(item_name)
    if item_name.is_a? String
      @items.each do |hash|
        if hash[:name] == item_name
          @items.delete(hash)
        end
      end
    elsif item_name.is_a? Array
      item_name.each do |string|
        @items.each do |hash|
          if hash[:name] == string
              @items.delete(hash)
          end
        end
      end
    else
      fail "Please input either an item name or an array of item names"
    end
  end

  def my_items
    puts ""
    puts "Your Cart".center(40)
    puts "--------------------".center(40)
    @items.each do |item_hash|
      puts "#{item_hash[:name].rjust(24)}: £#{sprintf('%.2f', item_hash[:price])}"
    end
    puts "--------------------".center(40)
    puts "Total Price".rjust(24)+": £#{sprintf('%.2f', total)}"
    puts ""
  end

  def total
    total = 0
    @items.each do |item_hash|
      total += item_hash[:price]
    end
    total
  end

  def my_total
    puts "£#{sprintf('%.2f', total)}"
  end

  def checkout(confirmed_price)
    fail "That total was incorrect. Please input the total price of your order to confirm checkout" unless confirmed_price == total
    time = (Time.now)
    delivery_time = time + (60 * 60)
    puts "Thank you, your order has been placed! It should arrive before #{delivery_time.strftime('%R')}"
    @items = []
  end

end
