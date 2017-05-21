class Menu

  attr_reader :dishes, :current_order

  def initialize
    @dishes = [{ "food" => 5 }]
    @current_order = []
  end

  def show_menu
    @dishes.each { |item| item.map { |name, price| puts "#{name}, #{price}" } }
  end

end
