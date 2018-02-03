# https://www.ruby-forum.com/topic/4415237

require_relative 'menu'

class Takeaway

  attr_reader :menu

  def initialize
    @menu = Menu.new
  end

  def see_menu
    @menu.print
  end

end
