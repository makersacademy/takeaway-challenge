class Restaurant
  attr_reader :menu
  def initialize(menu = { steak: "£12.50", pasta: "£7", fish: "£10" })
    @menu = menu
  end

  def show_menu
    @menu.each { |k, v| puts "#{k}: #{v}" }
  end
end
