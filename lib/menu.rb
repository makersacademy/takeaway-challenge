# Menu class
class Menu

  attr_reader :dish_list

  def initialize(dish, menu=nil)
    @dish_list = []
    @dish = dish
    create_menu(menu)
  end

  # this will generate randomised dishs to add to our menu
  def create_menu(menu=nil)
    if menu.nil?
    15.times do
      dish = @dish.new((0..(2+ rand(8))).map { (97 + rand(25)).chr }.join(''), rand(5000))
      @dish_list.push(dish)
    end
    else @dish_list = menu
    end
  end

end
