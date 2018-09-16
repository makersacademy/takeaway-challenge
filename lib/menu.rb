class Menu
  def initialize
    @menu = {
    foo: 1,
    bar: 2,
    baz: 3
    }
  end

  def show
    @menu.each { |food, price| puts "#{food}: £#{price}" } 
  end
end

