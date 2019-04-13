class Takeaway
  attr_reader :order

  def menu
    {
      spring_rolls: 4.55,
      grilled_dumpling: 4.9,
      chicken_fried_rice: 6.95,
      won_tom: 7.95,
      curry_breef_brisket: 7.95,
      coke: 1.2,
      ice_tea: 2.55
    }
  end

  def take_order(order)
    @order = order
    validate_dishes
  end

  def order_match?(num)
    order.values.reduce(& :+) == num
  end

  private

  def validate_dishes
    available_dishes = menu.keys
    not_availbe_dishes = @order.keys.reject { |k| available_dishes.include?(k) }
    is_are = (not_availbe_dishes.size <= 1 ? "is" : "are")
    msg = " #{not_availbe_dishes.join(" and ")} #{is_are} not availbe"

    raise msg unless not_availbe_dishes.empty?
  end

end
