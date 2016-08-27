class Menu
  def initialize
    @menu = {"Tomato, Garlic & Oregano" => 4.50}
  end

  def show
    puts menu
  end

  private

  attr_reader :menu

end
