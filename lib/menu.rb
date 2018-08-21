class Menu
attr_reader :dishes

  def initialize(dishes = [])  # (dishes = [{ 'pie' => 3, 'mash' => 2, "peas" => 1 }])
    @dishes = dishes
  end

  def list 
    raise 'This menu is empty' if dishes.empty?
    @dishes.each { |dish| puts "#{dish.name}  :  #{dish.price}" }
  end

end