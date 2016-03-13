# require_relative 'menu'

class Order

  def initialize (menu = Menu.new)
    @menu = menu
    @list = {}
    @sub_total = {}
    @total = 0
  end

  def list
    @list.dup
  end

  def sub_total
    @sub_total.dup
  end

  def view_menu
    menu.view_contents
  end

  def pick(dish, amount = 1)
    raise no_dish_error unless menu.contains?(dish)
    return add_to_order(dish,amount) unless order_contains?(dish)
    increase_order_of(dish,amount)
  end

  def remove(dish)
    raise dish_not_ordered_error(dish) unless order_contains?(dish)
    @list.delete(dish)
  end

  def change(dish, amount = 1)
    raise dish_not_ordered_error(dish) unless order_contains?(dish)
    @list[dish] = amount
  end

  def reset
    @list ={}
    @sub_total = {}
  end

  def sub_total_orders
    create_sub_totals
    sub_total
  end

  def total_cost
    sub_total_orders
    @total = sub_total.values.inject(0) do |total, amount_price|
      total += amount_price.last
    end
  end

  def confirm_order
    message
  end


  private

    def message
      "Your order costs: £#{@total} and will arrive before #{arrival_time}"
    end

    def arrival_time
      (Time.new + 3600).strftime("%H:%M:%S")
    end


    def menu
      @menu.dup
    end

    def create_sub_totals
      list.each do |dish,amount|
        amount_price = []
        amount_price << amount << menu.view_contents[dish]*amount
        @sub_total[dish] = amount_price
      end
    end

    def order_contains?(dish)
      !list[dish].nil?
    end

    def add_to_order(dish, amount)
      @list[dish] = amount
    end

    def increase_order_of(dish,amount)
      @list[dish] += amount
    end

    def no_dish_error
      'The dish is not on the menu'
    end

    def dish_not_ordered_error(dish)
      "#{dish.capitalize} not ordered"
    end
end
