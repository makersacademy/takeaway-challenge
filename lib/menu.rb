class Menu

DEFAULT_MENU = [{ :dish => "Chicken Curry", :price => 6.50 },
                { :dish => "Lamb Curry", :price => 7 },
                { :dish => "Vegetable Curry", :price => 6 },]

  def initialize(list_of_dishes = DEFAULT_MENU)
    @list_of_dishes = list_of_dishes
  end

  def print
    @list_of_dishes.each { |line|
      puts "#{line[:dish]} £#{line[:price]}"
    }
  end
end
