# require './requirements.rb'

class Menu

  attr_reader :menu_list

  def initialize
    @menu_list = { :pepperoni => 10,
                   :hawaiian => 12,
                   :meat_feast => 15,
                   :vegetarian => 9,
                   :spicy_sauasage => 11
                  }
  end

end
