# Allows customer to select and add dishes to new order

require_relative 'menu.rb'

class Order

attr_reader :options, :new_order

  def initialize
    @new_order = []
    @options = Menu.new
  end

  def see_options
    options.menu
  end

  # def select_meal(dish)
  #   dish =
  # end


end
