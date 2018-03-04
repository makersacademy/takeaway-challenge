class Restaurant
  attr_reader :menu
  def initialize(menu = { steak: "£15", sausages: "£9", mash: "£3" })
    @menu = menu
  end

  def show_menu
    @menu.each { |k, v| puts "#{k}: #{v}" }
  end
end
