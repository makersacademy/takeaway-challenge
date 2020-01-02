class DishList
  attr_reader :dish_list

  def initialize (dish_class)
    @dish_class = dish_class
    @dish_list = []
  end

  def load (filename = './lib/menu.json')
    @data = JSON.parse(File.read(filename))
    @data["menu"].each do |hash1|
      @dish_list << @dish_class.new(hash1["name"], hash1["price"])
    end
  end

  def see_menu
    x = 0
    @dish_list.each { |dish| puts "#{x += 1}. #{dish.name} Price: £#{dish.price}" }
  end
end
