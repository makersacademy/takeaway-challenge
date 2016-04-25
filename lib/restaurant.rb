class Restaurant

attr_reader :menu_class, :messager_class

  def initialize(menu_class = Menu.new, messager_class = Messager.new)
    @menu_class = menu_class
    @messager_class = messager_class
  end

  def display_menu
    menu_class.access
  end

  def complete_order
    messager_class.send
  end
end