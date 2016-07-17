class Menu

  attr_reader :dishes

  # The dishes in the menu should be symbols. The menu should also be in a
  # separate file (/database). For now, they are left as strings for friendlier
  # output from the view method.
  def initialize
    @dishes = { :satay => 7.99,
              :rojak => 7.99,
              :nasi_goreng => 10.99,
              :nasi_lemak => 12.99,
              :mee_rebus => 8.99,
              :hokkien_mee => 9.99,
              :curry_laksa => 12.99,
              :roti_canai => 7.99,
              :roti_ => 7.99,
              :char_kway_teow => 9.99,
              :curry_rendang => 12.99,
              :ais_kacang => 6.99,
              :cendol => 6.99,
            }
  end

  def view
    dishes.each do |dish, price|
      puts "#{dish}" + dots(dish) + "£#{price}"
    end
  end

  private

  def dots(dish)
    '.' * (50 - dish.length)
  end

end
