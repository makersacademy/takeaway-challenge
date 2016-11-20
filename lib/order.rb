# Allows customer to select and add dishes to new order
require_relative 'menu.rb'
require_relative 'delivery'

class Order

attr_reader :options, :new_order, :delivery

  def initialize(klass1, klass2)
    @new_order = []
    @options = klass1.new.menu_list
    @delivery = klass2.new
  end

  def see_options
    options
  end

  def select_pizza
    order = options.select {|k,v| k == :pizza}
    new_order << order
  end

  def select_thai
    order = options.select {|k,v| k == :thai}
    new_order << order
  end

  def select_mexican
    order = options.select {|k,v| k == :mexican}
    new_order << order
    end

  def order_total
    new_order.flat_map(&:values).inject(:+)
  end

  def delivery_message
    delivery.delivery_text #not working twilio gem didn't install properly.
  end

  def receive_order
    delivery.delivery_time
  end

end
