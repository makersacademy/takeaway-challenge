class Dishes

  attr_reader :menu

  def initialize
    @menu = {"Seeds" => 50, "Eyeballs" => 25, "Camel Breast" => 40, "shoes" => 78 }
  end


  def viewlist
    puts "Beatrice's restaurant menu -"
    @menu.each { |food, price| puts " #{food} £#{price.to_s} " }
  end

end
