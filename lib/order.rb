class Order
  attr_reader :total, :items, :menu

  def initialize(menu = Menu.new)
    @items = []
    @total = 0
    @menu = menu
  end

  def add
    p "Please enter your order in this format: Salad, Curry, etc."
    input = user_input
    input.each do |item|
      title = item + ": " + @menu.list[item].to_s
      @items.push(title)
      @total += @menu.list[item]
    end
  end

private

  def user_input
    gets.chomp.split(", ")
  end

end
