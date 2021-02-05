class Viewer
  def view(dishes)
    dishes.map { |dish| { "#{dish.name}" => "#{convert(dish.price)}" } }
  end

  private

  def convert(price)
    "£#{price.to_s.chars[(0..-3)].join}.#{price.to_s.chars[(-2..-1)].join}"
  end
end
