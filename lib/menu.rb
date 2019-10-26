class Menu
  def initialize
    @list = { "rice" => 1.50, "fries" => 2.50, "noodles" => 3.50, "pasta" => 6.50, "pizza" => 7.50 }
  end

  def view_list
    @list
  end
end
