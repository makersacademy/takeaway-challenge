class Menu

  attr_reader :dishes, :basket

  def initialize
    @dishes = [{ "food" => 5 }]
    @basket = []
  end

  def show_menu
    @dishes.each { |item| item.map { |name, price| puts "#{name}, #{price}" } }
  end

  def order_item(list_number, quantity)
    quantity.times { @basket << @dishes[list_number - 1] }
  end

end
