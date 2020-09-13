require 'Ordering'
require 'SMS'

class Takeaway
  def initialize(menu:, ordering: nil, sms: nil, config: {}) # injecting menu as we don't want to creat menu in takeaway class
    @menu = menu
    @ordering = ordering || Ordering.new(menu) #initialize order from order class, order being nil
    @sms = sms || SMS.new(config)
  end

  def print_menu # US1
    menu.print # calling the menu from the Menu class, menu will handle printing the menu
  end

  def place_order(list_of_dishes)
    add_dish(list_of_dishes)
    sms.deliver_sms
    ordering.sum
  end

  private

  attr_reader :menu, :ordering, :sms # making menu, order accessible

  def add_dish(list_of_dishes)
    list_of_dishes.each do |dish, qty|
      ordering.add(dish, qty)
    end
  end

end