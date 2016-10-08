class Menu

  def initialize
    @menu = {"Sabich" => 6, "Houmous" => 4, "Baba Ganoush" => 4, "Salona" => 8, "Shashuka" => 9, "Tabbouleh" => 5}
  end

  def display
  print @menu.map{ |x, i| [i, x] }
  end

end
