class Takeaway

  DISHES = {burger: 10, fish: 8, chips: 2}

  def see_dishes
    DISHES.each do |name, price|

      puts "#{name.capitalize} - £#{price}"

    end
  end

end
