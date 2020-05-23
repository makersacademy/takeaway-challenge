class Dishes
  attr_accessor :menu

  def initialize
    @menu = {
      "pavlova" => 4,
      "financier" => 3.50,
      "croissant" => 2,
      "tart" => 3,
      "gateau" => 15,
      "canele" => 1.50
    }
  end

  def view
    new = @menu.each do | k, v|
      puts "#{k} : £#{v.to_f}"
    end
    new
  end
end
