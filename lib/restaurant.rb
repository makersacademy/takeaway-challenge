class Restaurant
  attr_reader :menu
  def initialize(menu = nil)
    @menu = menu
  end

  def show_menu
    @menu.each { |k, v| puts "#{k}: #{v}" }
  end
end
