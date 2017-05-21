require_relative 'menu'
require_relative 'notifier'

class Takeaway

  def initialize(menu = Menu.new, notifier = Notifier.new)
    @menu = menu
    @notifier = notifier
  end

  

  def send_text()
    notifier.send_text("Thank you for your order: £#{price}")
  end


end
