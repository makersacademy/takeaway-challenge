# require './requirements.rb'

class Menu

  attr_reader :menu_list

  def initialize
    @menu_list = { 'pepperoni' => 10,
                   'hawaiian' => 12,
                   'meat feast' => 15,
                   'vegetarian' => 9,
                   'spicy sausage' => 11,
                   'awesome sauce' => 0.59
                  }
  end

end
