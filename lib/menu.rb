require 'yaml'

class Menu

  # DEF_MENU = [{dish: 'fries', price: 1.0}, {dish: 'fish', price: 1.5}]

  def initialize(file_name = 'menu.yml')
    @menu = YAML.load_file(file_name)
    # @menu = YAML::load File.read menu
    # @menu = YAML.load(File.open("menu.yml"))
  end

  def print
    k=1
    @menu.each do |item|
      puts "#{k}. #{item[:dish]} ... £#{'%.2f' % item[:price]} "
      k+=1
    end
  end

  def dishes
    @menu
  end

  def number_of_dishes
    @menu.dup.length
  end

  def select(item_number, amt)
    {dish: @menu[item_number-1][:dish], price: @menu[item_number-1][:price], quantity: amt}
  end
end
