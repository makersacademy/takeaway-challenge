require_relative 'dish'
require_relative 'order'
require_relative 'message_sender'

class Menu

  attr_reader :list

  def initialize(food)
    @list = food
  end

  def list_menu
    @list.map { | dish |
      "#{dish.name} - £#{dish.price}"
    }.join("; ")
  end



end