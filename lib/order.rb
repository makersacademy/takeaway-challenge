class Order

attr_reader :list_of_dishes, :current_order

  def initialize
    @list_of_dishes = { "pizza" => 9, "peperroni" => 10 }
    @current_order
  end

  # def list_of_dishes
  #   { :pizza => 9 }
  # end

  def order(order, quantity)
    @current_order

    "You have ordered #{quantity} #{order}(s)."
  end


private

  def bill

  end

end
