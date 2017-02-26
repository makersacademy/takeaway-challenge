require_relative 'menu'

class Takeaway

  def initialize(menu = Menu.new )
    @menu = menu
  end


private

attr_reader :menu

end
