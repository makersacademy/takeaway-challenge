# Allows customer to select and add dishes to new order

require_relative 'menu.rb'

class Order

attr_reader :options, :new_order

  def initialize(klass)
    @new_order = []
    @options = klass.new.menu_list
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


end
