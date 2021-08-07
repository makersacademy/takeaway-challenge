class Menu

  attr_reader :items
  def initialize(items)
    @items = items
  end

  def show_menu
    @items.each do |item|
      item.each do |k, v|
        puts "#{k}: £#{v}"
      end
    end
  end
end

# items = [{"Chicken burger" => 10}, {"Vegan Soup" => 5}, { "Chang Beer" => 3}]

# menu = Menu.new(items)
# menu.show_menu