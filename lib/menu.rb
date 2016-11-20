class Menu

attr_reader :menu_list

  def initialize
    @menu_list = {
      "Pizza" => 10,
      "Fish and chips" => 8,
      "Onion bhaji" => 5,
      "Pickled egg" => 2
    }
  end

end
