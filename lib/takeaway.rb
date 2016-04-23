require 'pry'
require 'order'
require 'sms'

class Takeaway

  def initialize(menu, order, sms)
    @menu = menu
    @order = order || Order.new(menu)
    @sms = sms || SMS.new
  end

  def show_menu
    @menu.print_menu
  end

  def place_order(dish, quantity)
    add_dishes(dish, quantity)
    @order.total
    sms.deliver
  end

  private

    def has_dish?(dish)
      @menu.dishes.include?(dish)
    end

    def add_dishes(dish, quantity)
      fail "The dish is not in the menu" unless has_dish?(dish)
      dish.quantity = quantity
      @order.selected_dishes << dish
    end

    attr_reader :sms
end