# to require or load
# require '~/Dropbox/makers_projects/makers_weekends/takeaway_challenge_we2-3/takeaway-challenge/lib/food_list.rb'
# load '~/Dropbox/makers_projects/makers_weekends/takeaway_challenge_we2-3/takeaway-challenge/lib/food_list.rb'

class FoodList
  CURRENT_MENU = {
    "Cheesey jalapeño bites" => 5.49,
    "Cheese and tomato pizza" => 11.99,
    "Dipping sauce" => 0.45,
    "Giant choc chip cookie" => 4.99,
    "Pepsi max" => 2.49}

    attr_reader :current_menu

  def initialize
    @current_menu = CURRENT_MENU
  end

  def print_menu
    @current_menu.each { |key, value|
    print "#{key}".ljust(30)
    puts "£#{value}".rjust(7) }
  end
end
