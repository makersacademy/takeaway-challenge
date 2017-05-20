class Menu
  attr_reader :items

  def initialize(items = [])
    @items = items
  end

  def add(item)
    @items << item
  end

  def show
    puts "THIS IS THE MENU:/nWe look forward to receiving your order!"
  end

end
