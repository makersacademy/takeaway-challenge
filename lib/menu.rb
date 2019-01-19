class Menu
  attr_reader :menu_items
  def initialize
    @menu_items = Hash[
      :ratsoup, 4,
      :mysterymeatpie, 5,
      :bread, 1,
      :juice, 1
    ]
  end
end
