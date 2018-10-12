class Menu
  def initialize
    @menu = {Burger: 3, Hotdog: 2}
  end

  def view
    @menu.each { |k,v| puts "#{k} = £#{v}"}
  end
end
