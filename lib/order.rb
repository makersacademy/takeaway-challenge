class Order

attr_reader :list_of_dishes, :current_order

  def initialize
    @list_of_dishes = { "pizza" => 9, "pepperroni" => 10 }
    @current_order = 0
  end

  # def list_of_dishes
  #   { :pizza => 9 }
  # end

  def order(order, quantity)
    @current_order += list_of_dishes[order].times{quantity}

    "You have ordered #{quantity} #{order}(s)."
  end


private

  def bill

  end

end
