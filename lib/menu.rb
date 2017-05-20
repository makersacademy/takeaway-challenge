class Menu
  attr_reader :items

  def initialize(items = [])
    @items = items
  end

  def add(item)
    @items << item
  end

  def show
    puts create_string
  end

  private

  def create_string
    string = "THIS IS THE MENU:\n\n"
    @items.each {|item| string = string + item.printed + "\n"} unless @items.empty?
    string + "\nWe look forward to receiving your order!"
  end

end
