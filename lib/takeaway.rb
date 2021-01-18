require_relative 'dish'
require_relative 'order'


class Takeaway
  attr_reader :order, :quantity

  def initialize(menu)
    @menu = menu
  end

  def list_dishes
    iteration = 0
    @menu.each { |dish| puts "#{iteration}. #{dish.name} : #{dish.price}"}
  end

end
