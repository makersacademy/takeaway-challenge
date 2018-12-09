require_relative "menu"
require_relative "summary"
require_relative "text"
require_relative "order"

module TakewayInterface
  class Takeway

    def initialize(menu = Menu.new)
      @menu = menu
      @order = nil
    end

    def run
      show_menu
      order
      show_total
      send_text
    end

    private

    def show_menu
      puts @menu.list
    end

    def order
      @order = Order.new.choose
    end

    def show_total
      puts Summary.new(@order).run
    end

    def send_text
      return Text.new.send_message
    end

  end
end
