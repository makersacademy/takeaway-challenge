require_relative 'menu'

class Takeaway

  attr_reader :menu
  def initialize(menu)
    @menu = menu
  end

end