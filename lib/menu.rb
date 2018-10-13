require "./lib/dish.rb"

class Menu

  attr_reader :dishlist

  def initialize
    @dishlist = {}
    @dishlist[:drink] = @dishlist[:drink] || [] << Dish.new("Juice", "drink")
    @dishlist[:dessert] = @dishlist[:dessert] || [] << Dish.new("Ice cream", "dessert")
    @dishlist[:main] = @dishlist[:main] || [] << Dish.new("Rissotto", "main")
    @dishlist[:main] = (@dishlist[:main] || []).push(Dish.new("Korma", "main"))
  end

  def print
    publish
  end

  def add_dish_to_menu(dish)
    raise "Dish already exists!" if check_item_in_menu(dish.name)
    @dishlist[dish.category] = (@dishlist[dish.category] || []).push(dish)
  end

  def get_dish(dishname)
    val = check_item_in_menu(dishname)
    raise "Not in Menu" if val == false
    val
  end

  def check_item_in_menu(dishname)
    @dishlist.each_value do |val|
      val.each do |dish|
        return dish if dish.getname == dishname
      end
    end
    return false
  end

  def publish_menu
    liststr = "* Here is the menu".center(30) << "\n"
    @dishlist.each_value do |disharr|
      disharr.each do |dish|
        liststr << " * " << dish.publish_dish << "\n"
      end
    end
    liststr
  end

end
