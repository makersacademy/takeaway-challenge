
class Menu
  ITEMS = {
    "meatballs" => 5,
    "carrots" => 2,
    "bread" => 1,
    "juice"=> 3,
    "milk" => 1
  }

  def initialize(items = ITEMS)
    @items = items
  end

end
