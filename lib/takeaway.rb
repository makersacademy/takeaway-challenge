class Takeaway

  attr_reader :name
  attr_reader :menu


  def initialize(name)
    @name = name
    @menu = []
  end

  def add_dish(dish)
    @menu.push(dish)
  end

  def return_menu
    @menu.each_with_index do |item, i|
      puts "#{i+1}: #{item.name} #{item.get_formatted_price}" if item.available == true
    end
  end

end
