class Restaurant

  def initialize(menu = menu_class, messenger = messenger_class)
    @menu = menu_class.new
    @messenger = messenger_class.new
  end


  def add_to_order
  end

  def order_total
  end

  def finalize_order
  end

end
