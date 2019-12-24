class Menu
  attr_reader :menu

  def initialize
    @menu = {
        :curry => 10,
        :pizza => 12,
        :pasta => 8,
        :fish => 10,
        :steak => 18
      }
  end

  def view
    "Menu:"
    menu.each_with_index do |(dish, price), i| 
      puts "#{i+1}. #{dish.to_s.capitalize} - £#{price}"
    end
  end

  def price(dish)
    menu[dish.to_sym]
  end

end