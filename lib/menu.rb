class Menu

  attr_reader :menu

  def initialize
    @menu = {"chicken noodle soup" => 3.50,
           "burger and fries" => 6,
           "chicken tikka madras" => 7,
           "fresh caesar salad" => 5.50,
           "traditional english breakfast" => 5,
           "singapore style noodles" => 4.50
           }
  end
end