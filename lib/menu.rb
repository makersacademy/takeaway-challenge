class Menu
  attr_reader :dishes, :name

  def initialize(name)
    @dishes = {
      spaghetti: ['Spaghetti deliciously cooked with tomato sauce and parmeggian cheese', 10],
      pizza: ['Pizza ai quattro formaggi', 9]
      }
    @name = name
  end

  def welcome
    "Welcome to #{@name}! Would you like to view our menu?"
  end

  def view
   "Tonight's menu is:
      1. #{@dishes[:spaghetti][0]}
      2. #{@dishes[:pizza][0]}"
  end

  def select(dish)
    @dishes[dish.to_sym]
  end
end


