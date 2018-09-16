class Menu 
  require_relative './menu_item.rb'
  attr_reader :items

  def initialize(items = default_items)
    @items = items
  end

  def default_items
    [
      MenuItem.new('Pizza', 8),
      MenuItem.new('Burger', 9),
      MenuItem.new('Chips', 4.5)                  
    ]
  end

  def show_menu
    @items.each_with_index do |item, index|
      puts "#{index+1}. " + item.format_item
    end
  end  

  def find_item(name)
    item = @items.detect do |item|
      item.name == name 
    end
    raise_error if item.nil?
    item
  end

  def find_price(name)
    
  end

  private

  def raise_error
    fail 'This dish is not on the menu!'
  end

end
