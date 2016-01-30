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

  def initialize(menu: MENU)
    @basket = []
    @menu = menu
    @total = 0
  end

  def read_menu
    MENU
  end

  def order(dish, number = 1)
    fail "This item isn't on the menu." unless @menu[dish]
    fail "For larger orders please phone us directly." if number > 10
    add_to_basket(dish, number)
  end

  def basket_summary
    @basket.dup
  end

  def calculate_price(price, number = 1)
    @total += price * number
  end

  def total
    "Total: #{@total.round(2)}"
  end

  private
    attr_reader :basket

    def add_to_basket(dish, number)
      @basket << dish
      calculate_price(@menu[dish], number)
      "#{number}x #{dish} added to your basket."
    end
end
