class Menu

  def initialize
    @items_list = {"miso soup" => 3.50}
  end
  
  def print_list
    items_list
  end

private

  attr_reader :items_list

end
