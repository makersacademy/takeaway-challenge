class Display
  def view(menu)
    menu.map { |meal, price| "#{meal.to_s.capitalize}: #{price}" }
  end

  def total(order)
    order.map(&:values).map(&:pop).sum
  end
end
