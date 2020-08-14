class Menu
  attr_reader :menu
  def initialize
    @menu = [
      { :item => "fried rice", :price => 3.50 },
      { :item => "sweet and sour pork", :price => 4.00 }
    ]
  end
end
