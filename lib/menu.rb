require_relative 'order'

class Menu

  attr_reader :menu

  def initialize(menu = [
      { 1 => "dinosaur eggs", :price => 3.0 },
      { 2 => "golden bones", :price => 10.0 },
      { 3 => "calamari milkshake", :price => 8.0 },
      { 4 =>  "durian gazpacio", :price => 8.0 },
      { 5 => "flakey teeth", :price => 8.0 }
    ])
    @menu = menu
  end

end
