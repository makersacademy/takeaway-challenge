require_relative 'menu'

class Takeaway

  def initialize
    @restaurants = ["Health food Haven"]
    restaurant_list
  end

  def restaurant_list
    "This is our list of restaurants #{@restaurants}"
  end

  def restaurant_choice(name)
    fail "Sorry we don't serve #{name} yet" unless @restaurants.include? name
#change fail to some form of error
    Menu.new
    name
  end
end
