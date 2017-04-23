require_relative 'take_away'

class Takeaway
  attr_reader :menu

  def menu
    @menu = {"Plain noodle" => "£3",
             "Egg fried rice" => "£3",
             "Special fried rice" => "£5",
             "Special chow mein" => "£5",
             "Sweet & sour chicken" => "£5",
             "Crispy beef" => "£5"}
  end


end
