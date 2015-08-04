
class Order
  MENU = { Pizza: 5,
           Pasta: 4,
           Steak: 6,
           Cod: 5 }

  attr_reader :menu, :ordered_dishes

  def initialize menu = MENU, twilio_sms
    @menu = menu
    @ordered_dishes = {}
    @total = 0
    @twilio_sms = twilio_sms
    @number = '+44**********'
  end

  def show_menu
    result = ''
    @menu.each do |dish, price|
      result += ("#{dish}, £ #{price}\n")
    end
    result
  end

  def add_order(dish, quantity)
    @ordered_dishes[dish] = quantity
  end

  def calculate_total
    total = 0
    ordered_dishes.each do |dish, quantity|
      total += menu[dish] * quantity
    end
    total
  end

  def verify_total
    result = ''
    @ordered_dishes.each do |dish, quantity|
      result += ("#{dish}, £ #{menu[dish]} * #{quantity}\n")
    end
    result += "Total amount: #{calculate_total}"
  end

  def confirm_order
    @twilio_sms.send_order_sms(@number)
  end

end
