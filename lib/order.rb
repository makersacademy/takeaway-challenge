class Order
  attr_reader :basket, :menu

    def initialize(menu)
      @basket = {}
      @menu = menu
    end

    def add_to_basket(dish, quantity)
      # fail "#{dish} isn't on our menu." if  @dishes.in_stock?(dish)
      @basket[dish] = quantity
      return "#{quantity}x #{dish} has been added to your basket."
    end

    def basket_subtotal
      total_qty * total_price
      #this is just returning the first item on the menu: pizza, multiplied by the qty we ordered: 2
    end

    private

    def total_qty
      @basket.each{ |dish, qty| return qty }
    end

    def total_price
      @menu.each { |dish, price| return price }
    end
end
