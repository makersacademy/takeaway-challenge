class Restaurant

attr_reader :menu_class, :messager_class

  def initialize(menu_class = Menu.new, messager_class = Messager.new)
    @menu_class = menu_class
    @messager_class = messager_class
  end

  def display_menu
    menu_class.access
  end

  def complete_order(time)
    send_text("Order confirmed, expected delivery time #{time}")
  end

  def send_text
    # call Twilio API
  end

end