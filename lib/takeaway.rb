
class TakeAway
  attr_reader :menu

  NOT_IN_MENU = "Item not in menu"

  def initialize
    @menu = {"fish and chips" => 4.34,
             "chicken korma" => 3.56,
             "sausges and mash" => 5.46,
             "cheeze pizza" => 2.87,
             "pepperoni pizza" => 3.93}
  end

  def list_menu
    @menu.dup
  end

  def order(item)
    raise NOT_IN_MENU if !menu.include? item
  end

end
