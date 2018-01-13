require_relative 'menu'

class Takeaway

  attr_reader :menu

  def initialize(menu = Menu)
    @menu = menu
  end

  # def print_list
  #   @price_list
  # end

end
