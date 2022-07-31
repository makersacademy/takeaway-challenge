class Menu
  attr_reader :dishes

  def initialize
    @dishes = {
      "ackee and saltfish" => 10,
      "callaloo and saltfish" => 10,
      "jerk chicken" => 9,
      "curry goat" => 10,
      "fried dumplings" => 2,
      "boiled plantain" => 2,
      "pepper pot stew" => 8,
      "escovitch fish" => 15,
      "steamed veg" => 5
    }
  end

  def welcome
    'Welcome to Trelawny field, di baddest kitchen inna England!'
  end

  def show_menu
    @dishes.collect do |k,v|
      "#{k} £#{v}"
    end
  end
end