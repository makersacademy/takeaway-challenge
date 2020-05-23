
class Order

  attr_reader :order

  def initialize(menu)
    @order = []
    @menu = menu
  end

  def add(dish, quantity)
    if dish_in_order?(dish)
      update_amount(dish, quantity)
    else
      add_new(dish, quantity)
    end
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

    def view_order
      @order.each { |dish| puts "#{dish[:dish]} x#{dish[:amount]} £#{two_decimals(dish[:price] * dish[:amount])}" }
      "Total: £#{two_decimals(total)}"
    end

    private

    def dish_in_order?(dish)
      @order.any? { |dishes| dishes[:dish] == dish }
    end

    def update_amount(dish, quantity)
      @order.each { |dishes| dishes[:amount] += quantity if dishes[:dish] == dish }
    end

    def add_new(dish, quantity)
      meal = @menu.return_dish(dish)
      @order.push({dish: meal[:dish], amount: quantity, price: meal[:value]})
    end

    def two_decimals(num)
      '%.2f' % num
    end

    def total
      sub_total = 0
      @order.each { |meal| sub_total += (meal[:price] * meal[:amount])}
      sub_total
    end

end
