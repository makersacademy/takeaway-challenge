require 'menu'
class Takeaway
  def initialize(menu = Menu)
    @menu =menu.new
  end
end
