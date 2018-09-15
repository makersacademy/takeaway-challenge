class Order
  attr_reader :summary

  def initialize
    @summary = Hash.new(0)
  end

  def add(dish, quantity)
    order = { name: dish.name, price: dish.price }
    @summary[order] += quantity

    #
    # if @summary.include?(dish.name)
    #   @summary[order] += quantity
    # end
    # @summary[order] = 1

  end
  # def add(dish, quantity)
  #   @summary.map! do |d|
  #     if d[:name] == dish.name
  #       d[:quantity] += quantity
  #
  #     end
  #   end
  #   @summary << { name: dish.name, price: dish.price, quantity: quantity }
  # end

end
