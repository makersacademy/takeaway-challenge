# Receives order, calculates price and returns total sum
require './lib/menu.rb'
require './lib/text.rb'


class Order
  attr_reader :basket, :total
  attr_writer :basket, :total
  
  def initialize
    @basket = []
    @total = 0
    @menu = Menu.new
  end

  def add_items(item, quantity = 1)
    if @menu.read_menu.keys.include? item
        @menu.read_menu.each do |key, value|
          if item == key
          @total = @total + (quantity * value)
          @basket << [item, quantity, value, quantity * value]
            end
          end
        else
          raise "#{item} is not available on this menu."
        end
      end

  def basket
    @basket.map do |arr|
    "#{arr[1]}x #{arr[0]}(s), Unit price: #{arr[2]}, Total price: #{arr[3]}"
    end
  end

  def total
    @total
  end

  def payment(amount)
    if amount == @total
      @total = 0
      confirmation
    else
      raise "Incorrect payment amount: Total amount is: £#{@total}"
    end
  end

  private

  def confirmation
    twilio = Text.new
    twilio.send_text_confirmation
  end
end
