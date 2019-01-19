class Menu

  attr_reader :dishes, :dish_list

  def initialize(dishes)
    @dishes = dishes
    @dish_list = []
  end

  def list_dishes
    @dishes.each do |hash|
       @dish_list << "#{hash[:item]} - £#{hash[:price]}"
    end
    puts @dish_list
  end

end
