

class Resturant

  attr_reader :dishes, :order, :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def view_menu
    menu.show_menu
  end

  def start_order
    @order = []
  end

  def cancel_order
    @order = nil
  end

  def add_to_order(dish, quantity)
    fail "order not started" if !order

    if dish_in_order?(dish)
      update_amount(dish, quantity)
    else
      add(dish, quantity)
    end

    def remove(dish, quantity = 1)
      if dish_in_order?(dish)
        @order.each { |dishes|
          if dishes[:dish] == dish && dishes[:amount] - quantity > 0
            dishes[:amount] -= quantity if dishes[:dish] == dish
          else
            @order.delete(dishes) if dishes[:dish] == dish
          end
        }
      else
        fail "#{dish} not in order"
      end
    end

  end

  private

  def dish_in_order?(dish)
    @order.any? { |dishes| dishes[:dish] == dish }
  end

  def update_amount(dish, quantity)
    @order.each { |dishes| dishes[:amount] += quantity if dishes[:dish] == dish }
  end

  def add(dish, quantity)
    @order.push({dish: dish, amount: quantity})
  end

end
