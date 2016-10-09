require_relative 'menu'
require_relative 'text'

class Order

  attr_reader :basket

    def initialize(menu = Menu.new)
      @menu = menu
      @basket = Hash.new(0)
    end

    def show_menu
      @menu
    end

    def add_to_basket(item, num = 1)
      @menu.valid_item(item)
      @basket[item] += num
    end

    def review_order
      order_total
      calculate_total
    end

    def checkout(payment, conf_method = Text.new)
      fail 'Please enter correct amount' unless validate(payment)
      conf_method.send_msg
    end

    private

    def order_total
      @basket.each do |item, num|
        subtotal = num * @menu.price(item)
        puts "#{num} x #{item}: £#{subtotal}"
      end
    end

    def calculate_total
      @total = @basket.inject(0) do |sum, (item, num)|
        sum + (num * @menu.price(item))
      end
      puts "Total: £#{@total}"
    end

    def validate(payment)
      calculate_total
      @total == payment
    end

end
