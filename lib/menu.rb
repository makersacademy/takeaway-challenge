class Menu

  attr_reader :dishes

  # The dishes in the menu should be symbols. The menu should
  # also be in a separate file (/database). For now, they are left
  # as string for friendlier output from the view method.
  def initialize
    @dishes = { "Satay" => 7.99,
              "Rojak" => 7.99,
              "Chee Cheong Fun" => 7.99,
              "Nasi Goreng" => 10.99,
              "Nasi Lemak" => 12.99,
              "Nasi Campur" => 11.99,
              "Nasi Dagang" => 10.99,
              "Mee Goreng" => 9.99,
              "Mee Rebus" => 8.99,
              "Hokkien Mee" => 9.99,
              "Nasi Kandar" => 10.99,
              "Charsiew Rice" => 10.99,
              "Curry Laksa" => 12.99,
              "Roti Canai" => 7.99,
              "Roti Jala" => 7.99,
              "Curry Ikan" => 14.99,
              "Char Kway Teow" => 9.99,
              "Ikan Bekar" => 12.99,
              "Nasi Kerabu" => 8.99,
              "Curry Rendang" => 12.99,
              "Nasi Kendar" => 10.99,
              "Popia Besar" => 7.99,
              "Ais Kacang" => 6.99,
              "Bubur Kacang" => 4.99,
              "Bubur Cha Cha" => 4.99,
              "Lemang" => 8.99,
              "Cendol" => 6.99,
              "Sago Gelu Melaka" => 4.99,
              "Kuih Nyonya" => 4.99,
              "Durian Dodol" => 3.99,
              "Gulab Jamun" => 3.99
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
