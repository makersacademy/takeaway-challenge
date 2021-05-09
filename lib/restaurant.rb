# Write a program that `puts`es an integer e.g. `160`.


class Restaurant

  def initialize(menu={"Santa Margherita" => 7.95, "Santa Carmela" => 9.95, "Santa Caterina" => 9.95, "San Mattia" => 10.95, "Rucolina" => 4.95})
    @menu = menu
  end

  def get_menu
    @menu
  end
end



