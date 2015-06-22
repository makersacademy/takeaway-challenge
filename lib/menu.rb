class Menu

  attr_reader :content

  def initialize
    @content = {"Fish and chips" => 7, "Steak and chips" => 10,
                "Shepherd's Pie" => 5, "Bangers and mash" => 5}
  end

  def read
    @content.each {|dish, price| puts dish.ljust(20) + price.to_s.rjust(2)}
  end

end
