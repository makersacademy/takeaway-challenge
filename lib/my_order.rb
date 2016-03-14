require_relative 'texter'
require_relative 'menu'

class MyOrder

TIME = Time.now + 3600
MESSAGE = "Thanks your order it will be with you by #{TIME.strftime("%H:%M")}"

  attr_reader :picks, :menu

  def initialize(menu, text_class: Text)
    @picks = []
    @menu = menu
    @text = text_class
  end

  def pick(plate, quantity=1)
    @picks << [@menu.choose(plate), quantity]
  end

  def total
    @picks.inject(0){|total,element| total + (element[0].price * element[1]) }.round(2)
  end

  def check_out
    string = "YOUR ORDER IS\n"
    @picks.each{|pick| string << "#{pick[0].name} x #{pick[1]}\n"}
    string << "TOTAL : #{self.total}\nTHANK YOU"
    string
  end

  def confirm_order
    @text.new.send_message(MESSAGE)
  end


end
