class Menu

  attr_reader :foods

  def initialize
    @foods = { "chicken" => 7, "lamb" => 10, "beef" => 12 }
  end

  def order
    output = @foods.find {|item| item.include?("chicken")}
    print output
  end

end
