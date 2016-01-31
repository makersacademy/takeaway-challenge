require_relative "notification"

class Takeaway

  MENU = { "Spring Roll" => 1.95,
           "Prawn Crackers" => 1.60,
           "Fried Pork Dumpling" => 2.10,
           "Won Ton" => 3.70,
           "Chicken and Noodle Soup" => 1.90,
           "Pork Chow Mein" => 4.60,
           "Szechuan Vegetables" => 4.15,
           "King Prawn Kung Po" => 5.40
         }.freeze

  def price_calc(price, number = 1)
    @total += price * number
  end

  def initialize(menu: MENU, notification_class: Notification)
    @basket = []
    @menu = menu
    @total = 0
    @basket_summary = []
    @notification_class = notification_class
  end

  def menu
    MENU
  end

  def basket_summary
    return "Your basket is empty" if unique_dishes_ordered == 0
    @basket_summary.join(",")
  end

  def order(dish, number = 1)
    fail "This item isn't on the menu." unless @menu[dish]
    fail "For larger orders please phone us directly." if number > 10
    @basket_summary << "#{dish} x #{number} = #{(@menu[dish]*number).round(2)}"
    add_to_basket(dish, number)
  end

  def confirm_order
    message = "Thank you for your order. Your meal will arrive by #{delivery_calc}!"
    @notification_class.new.send_sms(message)
    message
  end

  def total
    "Total: #{@total.round(2)}"
  end

  private
    attr_reader :basket

    def unique_dishes_ordered
      @basket.count
    end

    def add_to_basket(dish, number)
      @basket << dish
      price_calc(@menu[dish], number)
      "#{number}x #{dish} added to your basket."
    end

    def delivery_calc
      time = (Time.now + 60 * 60).asctime.split[3]
    end
end
