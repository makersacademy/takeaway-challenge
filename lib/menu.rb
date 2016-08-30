class Menu

  attr_reader :menu, :name, :transfer

  def initialize(name)
    @name = name
    @menu = []
  end

  def add_to_menu(dish)
    @menu << dish
  end

  def remove_from_menu(dish)
    @menu.delete(dish)
  end

  def show_menu
    @menu.each do |i|
      puts "Item: #{i.name}. Price #{i.price}"
    end
  end

  # def iterate
  #   @transfer = []
  #   @menu[0].dup.each do |i|
  #     @transfer << [i.name, i.price]
  #   end
  # end

end
