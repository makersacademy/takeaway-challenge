class Takeaway

  DISHES = {burger: 10, fish: 8, sausage: 5, chips: 2}

  def see_dishes
    DISHES.each { |name, price| puts "#{name.capitalize} - £#{price}" }
  end

end
