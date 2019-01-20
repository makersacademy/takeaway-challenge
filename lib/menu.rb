class Menu
  attr_reader :menu_items
  def initialize
    @menu_items = Hash[
      "rat soup", 4,
      "mystery meat pie", 5,
      "bread", 1,
      "juice", 2
    ]
  end
end
