require './lib/menu.rb'

class Takeaway
  attr_reader :dishes, :menu
  def initialize
    @dishes = {
      "marinara" => 5,
      "margherita" => 6,
      "napoli" => 6,
      "calzone" => 8
    }
    @menu = Menu.new
  end

  def visualise_menu
    @menu.show_menu(@dishes)
  end 
end
