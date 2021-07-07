require_relative "menu"

class Order
  attr_reader :choices, :choice
  MENU = {
    "lasagna" => 10,
    "spaghetti" => 5,
    "gnocchi" => 7
  }

  def initialize
    @choices = []
  end

  def choose(choice)
    if MENU.include?(choice)
      @choices << [@choice = choice, MENU[choice]]
      @choices
    else
      "Not a menu option"
    end
  end

  def verify
    sum = 0
    @choices.each do |choice|
      sum += choice[1]
    end
    "Your current total is #{sum}."
  end

  def submit
    "Thanks for ordering! Your order is on its way!"
  end

end
