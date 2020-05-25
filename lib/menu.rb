class Menu

  attr_reader :list

  def initialize
    @list = {
      "Apple" => 1,
      "Banana" => 2,
      "Mango" => 3,
      "Peach" => 4,
      "Pear" => 5
      }
  end

  def view
    @list
  end

end
