class Menu

  attr_reader :dishes

  def initialize
    @dishes = [ {"food"=>5} ]
  end

  def show_menu
    @dishes.each { |item| item.map { |name, price| puts "#{name}, #{price}" } }
  end

end
