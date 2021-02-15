require_relative './dish'
class Menue 
  attr_reader :menue
  
  def initialize 
    @menue = [
        Dish.new(1, "Pad Thai", 5.50),
        Dish.new(2, "Big Mac", 2.50),
        Dish.new(3, "French Toast", 3.31),
        Dish.new(4, "Omlette", 2.25),
        Dish.new(5, "Vegan Saussage", 0.99),
        Dish.new(6, "Plain Bread", 250),
        Dish.new(7, "Makers Special", 1.99),
        Dish.new(8, "Space Cakes", 10.50),
    ] 
  end 
  
  def print_menue
    @menue.each { | dish | 
      puts " #{dish.menue_number}: #{dish.name} -- £#{dish.cost} \n "
    }
  end 

  def look_for_dish(name_keyword_or_number) 
    if name_keyword_or_number.is_a?(Integer)
      @menue.each { |dish| return dish if dish.menue_number == name_keyword_or_number}
    elsif name_keyword_or_number.is_a?(String)
      @menue.each { |dish| return dish if dish.name.downcase.include?(name_keyword_or_number.downcase)}
    end 
  end
  
end 