class Takeaway
  def customer name
    name
  end

  def menu
    { meal_small: 5, meal_medium: 10, meal_large: 15 }
  end

  def show_menu
    to_return = ""
    menu.each { |k, v| to_return << k.to_s << ": £" << v.to_s << "\n" }
    to_return
  end
end
