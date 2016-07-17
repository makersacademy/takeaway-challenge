class Menu

  attr_reader :dish_list

  def initialize
    @dish_list = {"pizza"=>3,
                  "burger"=>2,
                  "chips"=>1}
  end

  def display
    count = 1
    dish_list.each do |food, price|
      "#{count}. #{food} #{price}"
      count += 1
    end
  end

  def add_to_menu(food,price)
    dish_list.store(food,price)
  end

end
