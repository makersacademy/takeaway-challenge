class Menu

  attr_reader :menu_list

  def initialize
    @menu_list = {
      "haddock" => 6,
      "cod" => 7,
      "plaice" => 6,
      "savaloy" => 3,
      "pukka pie" => 2.5,
      "chips" => 2,
      "mushy peas" => 3
    }
  end

end
