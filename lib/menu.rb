class Menu
  attr_reader :dishes

  def initialize(menu_name: :italian)
    @dishes = load_menu(menu_name)
  end

  def show
    items = dishes.map { |item, price| "#{item}: £#{price}"}
    "Menu\n\n#{items.join("\n")}"
  end

  def listed? item
    dishes.include? item
  end

  private
  def load_menu(menu_name)
    file_name = "lib/menus/#{menu_name.to_s}.menu"
    File.open(file_name).map { |line| line.chomp.split(' => ') }.to_h
  end
end
