class Takeaway
  def customer name
    name
  end

  def menu
    { meal_small: 5, meal_medium: 10, meal_large: 15 }
  end

  def show_menu
    to_return = ''
    # menu.map { |key, value| to_return << key.to_s + ': £' + value.to_s }.join(', ')
    # menu.map { |key, value| to_return << "#{key}: £#{value}" }.join(', ')
    menu.each { |key, value| to_return << key.to_s << ': £' << value.to_s << '\n' }
    # menu.join(': £', ', ')
    to_return
  end
end
