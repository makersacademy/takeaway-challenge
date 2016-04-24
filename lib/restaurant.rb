class Restaurant

attr_reader :menu_class, :messager_class

  def initialize(menu_class = Menu.new, messager_class = Messager.new)
    @menu_class = menu_class
    @messager_class = messager_class
  end

  def display_menu
    menu_class.access
  end

  def complete_order(price)
    send_text("Order confirmed: £#{price}")
  end

  def send_text(message)
    # call Twilio API
  end

end