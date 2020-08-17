require_relative 'order'

class Menu

  def avail_dishes
    {
      :salmon => 3.50,
      :chicken => 4.50,
      :salad => 2.50,
      :cheeseburger => 3.00
    }
  end

  def customer_view
    list = []
    avail_dishes.each do |dish, price|
      list << "#{dish} - £#{price} "
    end
    puts "Menu: "
    puts list
  end

end
