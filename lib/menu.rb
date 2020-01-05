class Menu
  attr_reader :menu

  def initialize(dish_class)
    @dish_class = dish_class
    @menu = []
  end

  def load(filename = './lib/menu.json')
    @data = JSON.parse(File.read(filename))
    @data["menu"].each do |hash1|
      @menu << @dish_class.new(hash1["name"], hash1["price"])
    end
  end

  def see_menu
    x = 0
    @menu.each { |dish| puts "#{x += 1}. #{dish.name} Price: £#{dish.price}" }
  end
end
