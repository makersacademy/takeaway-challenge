class Restaurant

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def display_menu
  end

  def create_order
    Order.new
  end

  def confirm
  end

end
