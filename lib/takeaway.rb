
class TakeAway
  attr_reader :menu, :selection

  def initialize
    @menu = {"fish and chips" => 4.34,
             "chicken korma" => 3.56,
             "sausges and mash" => 5.46,
             "cheeze pizza" => 2.87,
             "pepperoni pizza" => 3.93}
    @selection = {}
  end

  def list_menu
    @menu.dup
  end

end
