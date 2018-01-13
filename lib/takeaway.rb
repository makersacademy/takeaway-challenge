class Takeaway

  attr_reader :menu

  def initialize
    @menu = {
      "Fish" => 2365,
      "Chips" => 1836,
      "Kebab" => 4317
    }
  end

  def print_menu
    menu
  end

end
