require_relative './menu.rb'

class Order

  def list_options
    menu = Menu.new
    menu.options
  end

end
