class Menu
  attr_reader :dishes
  
  def initialize
    @dishes = {}
  end
  
  def add_dish(name:, price:)
    dishes[name] = price
  end
  
  def remove_dish(name)
    dishes.delete name
  end
  
  def to_s
    return "The menu is empty" if dishes.empty?
    dishes.each do |dish, price|
      puts "#{dish} : £#{price}"
    end
  end
  
  def print
    self.to_s
  end
end