class Takeaway
  attr_reader :menu
  def initialize
      @menu = [{ name: "Hamburger", price: 1},{name: "Pizza", price: 2}]
  end

  def dishes
    @menu.map{ |dish| p "#{dish[:name]}: £#{dish[:price]}"}*", "
  end
end
