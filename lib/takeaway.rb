class Takeaway
  attr_reader :menu, :selected_items

  def initialize
    @menu = { "burritos" => 7, "tacos" => 5, "chips" => 3, "guacamole" => 2 }
    @selected_items = []
  end

  def order(item, quantity)
    @selected_items << { item => quantity }
  end
end
