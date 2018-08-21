class Menu
attr_reader :dishes

  def initialize(dishes = [])
    @dishes = dishes
  end

  def list 
    raise 'This menu is empty' if dishes.empty?
    @dishes.each { |dish| puts "#{dish.name}  :  #{dish.price}" }
  end

end