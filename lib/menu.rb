require "dish"

class Menu

attr_reader :dishlist

  def initialize()
    @dishlist = {}
    @dishlist[:drink]  = Dish.new("Juice","drink")
    @dishlist[:dessert] =  Dish.new("Ice cream", "dessert")
    @dishlist[:main] = Dish.new("Rissotto","main")
  end

  def print
    publish
  end

  def add_dish(name,category)
    @dishlist[category] <<  Dish.new(name, category)
  end

  def publish
    liststr = ""
    @dishlist.each_with_index { |dish, key|
      liststr << "\n" if liststr.length>0
      liststr  " * " << dish.publish_dish << " * "
    }
    liststr
  end

end
