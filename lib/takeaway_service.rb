require_relative 'menu'
require_relative 'dish'
require_relative 'send_sms'

class TakeawayService
  attr_reader :basket

  def initialize(menu_class = Menu.new)
    @menu_class = menu_class
    @basket = {}
  end

  def add_to_basket(dish, quantity = 1)
    not_on_menu_message = "Cannot add to basket: dish not on the menu"
    raise not_on_menu_message if dish_not_on_the_menu(dish)

    incorrect_quantity_message = "Cannot add to basket: quantity not recognised"
    raise incorrect_quantity_message if quantity_less_than_1(quantity)

    if already_added?(dish)
      add_quantity(dish, quantity)
    else
      add_selection(dish, quantity)
    end
    "#{quantity} #{dish}(s) added to your basket"
  end

  def view_menu
    @menu_class.view
  end

  def order_summary
    print order
  end

  def total_cost
    print cost
  end

  def place_order
    SendSms.new.message
  end

  private

  def dish_not_on_the_menu(dish)
    !@menu_class.menu_items.flatten(3).delete_if {
      |x| x.instance_of? Symbol
    }.delete_if { |x| x[0] == "£" }.include?(dish)
  end

  def quantity_less_than_1(quantity)
    quantity < 1
  end

  def already_added?(dish)
    @basket.has_key?(dish)
  end

  def add_quantity(dish, quantity)
    @basket[dish] += quantity
  end

  def add_selection(dish, quantity)
    selected_dish = Dish.new(dish)
    @basket.store(selected_dish.dish, quantity)
  end

  def order
    dish_orders = []
    @basket.map { |dish, quantity|
      dish_orders << "#{dish} x#{quantity} = £" +
      "#{menu_as_flat_array[menu_as_flat_array.index(dish) + 1
    ].to_f * quantity}"
    }
    dish_orders.join(", ")
  end

  def cost
    dish_costs = []
    @basket.map { |dish, quantity|
      dish_costs << menu_as_flat_array[menu_as_flat_array.index(dish) + 1
      ].to_f * quantity
    }
    "£" + "#{dish_costs.reduce(:+)}"
  end

  def menu_as_flat_array
    @menu_class.menu_items.flatten(3)
  end
end
