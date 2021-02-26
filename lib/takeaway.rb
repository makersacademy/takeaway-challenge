require_relative 'menu'
require_relative 'sms'

class TakeAway
  attr_reader :menu, :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def order(item, quantity = 1)
    quantity.times do
      @menu.list.each do |dish|
        @basket << dish if dish[:dish] == item
      end
    end
  end

  def view_order
    @basket.each { |item| puts "#{item}" }
    "Your order total so far is: £#{check_total}0"
  end

  def check_total
    @basket.map { |item| item[:price] }.sum
  end

  def complete_order(phone_number)
    Sms.new(phone_number)
  end

end
