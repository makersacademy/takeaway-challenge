
class Menu
  attr_reader :menulist

  def initialize
    @menulist = {"Chinese" => 8,
      "Indian" => 9,
      "Italian" => 10,
      "Kebab" => 5,
      "Sandwich" => 3,
      "Condensed Air" => 1
    }

  end

  def order(dish, quantity)
    puts "-----"
    puts @menulist
    v = @menulist.select { |key, value| dish.include? key }.values
    v = v.join.to_i
    v * quantity
  end
end
