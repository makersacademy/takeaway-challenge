require_relative "order"

class OrderManager

  attr_reader :orders

  def initialize
    @orders = []
  end

  def prices_sum(list_of_dishes)
    @total = 0
    list_of_dishes.each { |dish| @total += dish.price }
    @total
  end


  def create_order(menu)
    @orders << Order.new([])
  end

  # def create_order
  #   print_dishes(dishes_list)
  #   @selected_dishes = []
  #   get_user_choices
  #   @orders << Order.new(@selected_dishes)
  # end

end
