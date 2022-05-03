class Restaurant
  m = Menu.new
  o = Order.new
  def run
     puts "Welcome to our takeaway. You can add and remove dishes then place your order. What would you like to do?"
     action = gets.chomp.downcase
     next_action
  end

  def next_action
    if action == "add"
      add
      next_action
    elsif action == "remove"
      remove
      next_action
    elsif action == "place"
      o.place
    end
  else
    puts "That doesn't seem to be a valid action, please choose add remove or place."
    action = gets.chomp.downcase
    next_action
  end

  def add
    puts "Here is our menu, what would you like to order?"
      m.view
      dishes = gets.chomp.downcase
      o.add(dishes)
      puts "Your basket total is #{o.total}, what would you like to do next?"
      action = gets.chomp.downcase
  end

  def remove
    puts "Here is your basket, what would you like to remove?"
      puts o.dishes.join("/n")
      dishes = gets.chomp.downcase
      o.remove(dishes)
      puts "Your basket total is #{o.total}, what would you like to do next?"
      action = gets.chomp.downcase
  end
end

r = Restaurant.new
r.run