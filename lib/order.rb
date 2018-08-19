class Order
attr_reader :basket
  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
  end

  def make_order(dish, quantity)
    add_to_basket(dish, quantity)
    # basket.merge!(dish quantity)
    "added to basket: #{dish} x#{quantity} for #{Menu.new.dishes[dish]} each"
  end

  def check_order
    total = 0
    printout = []
    basket.each do | element |
      element.each do | dish, price |
        total += price
        printout << "#{dish}: #{price}"
      end
    end
     printout << "total = #{total}"
     printout
    # "#{dish} x#{quantity}: #{price_calculator(dish, price, quantity)}"
  end

# "spring rolls x2: £7.98"

# private

  def add_to_basket(dish, quantity)
    quantity.times do
      basket << {dish => @menu.dishes[dish]}
    end
# currently only showing it once
# array of hashes to allow for duplication?
  end

  # def price_calculator(dish, quantity)
  #
  # end

end
