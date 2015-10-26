require_relative "menu"
require_relative 'twilio'


class Takeaway

  attr_reader :selected_dishes, :total

  def initialize (menu = Menu.new, twilio = Twilio_sms.new)
    @menu = menu
    @selected_dishes = Hash.new(0)
    @total = 0
    @total_per_dish = 0
    @twilio = twilio
  end

  def menu_restaurant
    @menu.dishes
  end

  def select_dishes(dish, quantity = 1 )
    total_order(dish, quantity)
    @selected_dishes[dish] += quantity
    info(dish, quantity)
  end

  def pay(money)
    if total == money
      send_message
      exit
    else
      raise "Amount paid not correct"
    end
  end

  private

  def send_message
    @twilio.send_text_message
  end

  def total_order(dish, quantity)
    selected = @menu.dishes.select {
      |key| key.to_s.match(dish) }
    @total_per_dish = selected[dish] * quantity
    @total += selected[dish] * quantity
  end

  def info(dish, quantity)
    info = "you ordered #{quantity} x #{dish} = #{@total_per_dish}, the total now is #{@total}"
    reset_total_per_dish
    info
  end

  def reset_total_per_dish
    @total_per_dish = 0
  end


end
