require_relative 'menu'

class Bill
attr_reader :calculated_amount, :descriminated_bill

  def initialize
    @calculated_amount = 0
    @descriminated_bill = []
  end

  def calculate(detailed_order)
    detailed_order.each do |(dish, quantity)|
      get_dish_price(dish)
      partial_total = (get_dish_price(dish) * quantity.to_i)
      @descriminated_bill << [dish, partial_total]
      @calculated_amount += partial_total
    end
    @calculated_amount
  end

  private
  def get_dish_price(dish_unit_order)
    price = 0
    list = load_menu
    list.each do |dish, unit_price|
      price = unit_price if dish_unit_order == dish
    end
    price
  end

  def load_menu
    menu = Menu.new
    menu.load_dishes
  end
end
