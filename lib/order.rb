require_relative "menu"
require_relative "sms_sender"

class Order

  NOT_ON_MENU_ERROR = "Sorry, that item is not on the menu."
  INCORRECT_ESTIMATED_TOTAL_ERROR = "Your estimated total is incorrect"
  EMPTY_BASKET_ERROR = "Your basket is empty!"

  attr_reader :total

  def initialize(menu = Menu.new, sms_sender = SmsSender.new)
    @basket = Hash.new(0)
    @menu = menu
    @sms_sender = sms_sender
  end

  def view_menu
    @menu.list
  end

  def basket
    @basket.dup
  end

  def add_to_basket(item, quantity=1)
    fail NOT_ON_MENU_ERROR unless @menu.list.include? item
    @basket[item] = quantity
  end

  def checkout(estimate=0)
    fail EMPTY_BASKET_ERROR if basket.empty?
    fail INCORRECT_ESTIMATED_TOTAL_ERROR if estimate != calculate_total
    @sms_sender.send_sms
  end

  private

    def calculate_total
      @basket.map { |item,quantity| @menu.price(item)*quantity }.inject(:+)
    end


end
