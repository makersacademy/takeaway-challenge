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

  def delivery_calc
    time = (Time.now + 60 * 60).asctime.split[3]
  end

  def price_calc(price, number = 1)
    @total += price * number
  end

  def initialize(menu: MENU)
    @basket = []
    @menu = menu
    @total = 0
    @basket_summary = []
  end

  def menu
    MENU
  end

  def basket_summary
    @basket_summary
  end

  def basket_message
    "Your basket is empty" if basket_number == 0
  end

  def order(dish, number = 1)
    fail "This item isn't on the menu." unless @menu[dish]
    fail "For larger orders please phone us directly." if number > 10
    @basket_summary << "#{dish} x #{number} = #{@menu[dish]*number}"
    add_to_basket(dish, number)
  end

  def confirm_order
    puts "Would you like to proceed with your order? (yes/no)"
    answer = gets.chomp
    "Thank you for your order. Your meal will arrive by #{delivery_calc}!" if answer == "yes"
  end

  def total
    "Total: #{@total.round(2)}"
  end

  private
    attr_reader :basket

    def add_to_basket(dish, number)
      @basket << dish
      price_calc(@menu[dish], number)
      "#{number}x #{dish} added to your basket."
    end

end
