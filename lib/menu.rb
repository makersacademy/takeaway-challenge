class Menu
  def initialize
    @menu = [
      { :name => "Burger", :price => 12.99 },
      { :name => "Soup", :price => 5.99 },
      { :name => "Sandwich", :price => 7.99 },
      { :name => "Curry", :price => 14.99 },
      { :name => "Steak", :price => 18.99 },
      { :name => "Beer", :price => 3.99 },
      { :name => "Juice", :price => 2.99 },
      { :name => "Salad", :price => 9.99 }
    ]
  end

  def add(dish)
    @menu.push(dish)
  end

  def show
    i = 1
    @menu.each { |dish|
      puts "#{i}. #{dish[:name]} for £#{dish[:price]}"
      i += 1
    }
  end

  def cost_of(name)
    cost = 0
    @menu.each { |dish|
      cost = dish[:price] if dish[:name] == name
    }
    cost
  end
end
