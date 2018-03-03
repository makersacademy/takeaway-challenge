# Menu class definition.
# It's responsible for saving dishes to menu and having Menu updated
class Menu
  attr_reader :menu
  def initialize
    @menu = []
  end

  def add_item(dish)
    @menu << dish
  end

  def remove_item(dish)
    @menu.delete(dish)
  end

  def list_all
    @menu.each_with_index do |v, i|
      puts "#{i + 1}: #{v.name} -- #{v.price}"
    end

  end
end
