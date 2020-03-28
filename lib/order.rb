class Order

  def dish_choice
    @choice = { 'apple' => 3 }
  end

  def order_total
    @choice = { 'apple' => 3 }.values.sum
  end
end