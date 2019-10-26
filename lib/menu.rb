
class Menu
  attr_accessor :items

  def initialize
    @items = {
      "meatballs" => 5,
      "carrots" => 2,
      "bread" => 1,
      "juice" => 3,
      "milk" => 1 }
  end

  def item_on_menu?(item)
    raise "I'm sorry, we don't have that" unless @items.has_key?(item)
    true
  end

end
