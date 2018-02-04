require_relative 'menu'
require_relative 'text'

class Order
  attr_reader :basket, :total, :items

  def initialize(menu = Menu.new)
    @basket = []
    @total = []
    @items = menu.items
    @text = Text.new
  end

  def add(customer_choice)
    items.each { |item| item.each do |key, value|
      if customer_choice == key
        @basket << "#{key}"
        @total << value
      end
    end
    }
    return @basket.inject(Hash.new(0)) { |total, x| total[x] += 1; total }
  end

  def price
    @total.inject(0, :+)
  end

  def checkout
    @text.send_sms("This is the voice of your conscience speaking - you eat a lot!")
  end
end
