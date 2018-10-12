require 'menu'

class Takeaway

# initialize without hard-coded menu? e.g. chinese or italian
  def initialize(menu = Menu.new)
    @menu = menu
  end

  def order
    @menu.view
  end


end
