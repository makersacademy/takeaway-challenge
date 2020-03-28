class CustomerOrder

  def see_order
    @choice = { 'apple' => 3 }
  end

  def total
    @choice = { 'apple' => 3 }.values.sum
  end
end