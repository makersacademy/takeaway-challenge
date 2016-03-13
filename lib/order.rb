
class Order

attr_reader :myorder, :menu

  def initialize
    @myorder = {}
    @menu = {"Chicken" => 5, "Lamb" => 8, "Chips" => 2}
  end

  def show_menu
    @menu.each do |key, value|
    puts '£' + value.to_s + '------------' + key
  end
  end

  def place_order(dish, quantity, total)
     raise "Sorry, that is not a dish on the menu" if !@menu.has_key?("#{dish}")
     myorder.store("#{dish}",quantity)
     myorder
  end

    def calculate_total
    end
end
