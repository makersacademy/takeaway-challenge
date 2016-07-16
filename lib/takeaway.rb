class Takeaway

  def initialize
    @restaurants = ["Health food Haven"]
    restaurant_list
  end

  def restaurant_list
    puts "This is a list of the restaurants you may order from"
    puts "Type the name of the restaurant you would like to see the menu of"
    puts @restaurants
  end

  def restaurant_choice(name)
    fail "Sorry we don't serve #{name} yet" unless @restaurants.include? name
#change fail to some form of error
    name
  end
end
