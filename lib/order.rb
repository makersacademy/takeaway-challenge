class Order

attr_reader :list_of_dishes

  def initialize
    @list_of_dishes = { :pizza => "£9" }
  end

  # def list_of_dishes
  #   { :pizza => 9 }
  # end

  def order(order)
    "You have ordered #{order}."
  end


private

  def bill
  end

end
