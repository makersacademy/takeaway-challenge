require_relative 'restaurant'


class Order

  attr_reader :receipt

  def initialize(restaurant_klass: Restaurant)
    @total = 0
    @restaurant_klass = restaurant_klass
    @restaurant = @restaurant_klass.new
    @receipt = ''
  end

  def total
    p "Your total is #{to_currency(@total.round(2))}"
  end

  def menu
    @restaurant.menu
  end

  def order(item, quantity)
    calculate_order(item, quantity)
    p "order placed"
  end

  def checkout(due)
    fail "Incorrect ammount paid" if due != @total
    @restaurant.checkout(@receipt + "Total is #{to_currency(@total)} ")
    reset
  end

  private

  def reset
    @receipt = ''
    @total = 0
  end

  def to_currency(amount)
    format("£%.2f",amount)
  end

  def calculate_order(item, quantity) #args of name and number
    item.each_with_index do |x| #for each item
      if menu.include?(x) #if MENU includes what they want
        quan = quantity[item.index(x)] #get the quantity they want
        price = quan * menu[x] #set the price to quantity multiplied by item price
        @total += price #change total to sum of prices
        @receipt << "#{x} x#{quan} at #{to_currency(price.round(2))}. " #create receipt
      else
        fail 'Item not available'
      end
    end
  end
end
