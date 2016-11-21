require_relative 'dishes_list'
require_relative 'dish'
require_relative 'notification'

class Order

  attr_reader :dishes, :current

  def initialize(dishes)
    @dishes = dishes
    @current = []
  end

  def load_list(dishes)
    @dishes = dishes
  end

  def show_available_dishes
    @dishes.list
  end

  def add_to_current(dish, quantity=1)
    dish_object = find_by_name_from_dishes(dish)
    item_in_order_already?(dish_object) ? increase_quantity(dish_object, quantity) : add_new_item_to_current(dish_object, quantity)
  end

  def total
    @current.inject(0) do |result, item|
      price, quantity = item[:dish].price, item[:quantity]
      result + price * quantity
    end
  end

  def complete(notification_klass)
    notification = notification_klass.new(@current, total)
    notification.send_sms
    clear_current_order
  end

  private

    def item_in_order_already?(dish)
      @current.any? { |item| item[:dish] == dish }
    end

    def find_by_name_from_dishes(dish)
      # do lots of exception testing
      @dishes.list.each { |item| return item if item.name == dish }
    end

    def increase_quantity(dish_object, quantity)
      @current.each { |item| item[:quantity] += quantity if item[:dish] == dish_object }
    end

    def add_new_item_to_current(dish_object, quantity)
      @current << {dish: dish_object, quantity: quantity}
    end

    def clear_current_order
      @current = []
    end

end
