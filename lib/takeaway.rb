require_relative 'send_sms'

class Takeaway
  attr_reader :menu, :cart
  def initialize
    @menu = { bread_and_water: '9.99', bread: '9.00', water: '0.99' }
    @cart = {}
    @cash_register = []
  end

  def full_menu
    @menu.each do |item, price|
      puts item.to_s.capitalize.gsub('_', ' ') + ': ' + "£#{price}"
    end
  end

  def select(item)
    item = item.downcase.gsub(' ', '_').to_sym
    fail 'food item not recognised' if @menu[item].nil?
    
    @cash_register << @menu[item].to_f
  end


  def cart_total
    @cash_register.inject { |a, e| p a + e }.round(2)
  end

  def finalise_and_send
    send_sms
  end
end
