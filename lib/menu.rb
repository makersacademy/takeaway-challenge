class Menu
  attr_reader :menu
  def initialize
    @menu = {"Pig's.brain" => 8, "Rosted.frog" => 10, "Camel.Curry" => 11.50, "Dolphin.salami" => 12.50, "Battered.axololt" => 5.50 }
  end

  def print_menu
    a = @menu.map{|key, value| p  "#{key} is at £#{value}"}
    p a.join("\n")
  end
end
