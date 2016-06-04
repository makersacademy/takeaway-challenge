class Menu

  attr_reader :menu, :name

  def initialize(name)
    @name = name
    @menu = []
  end

  def add_to_menu(*args)
    @menu << args
  end

  def remove_from_menu(dish)
    @menu.delete(dish)
  end

  def show_menu
    @menu[0].each do |dish|
      puts "Item: #{dish.name}. Price #{dish.price}"
    end
  end

end
