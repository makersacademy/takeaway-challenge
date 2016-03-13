class MyOrder

DEL_TIME = Time.now + 3600

  attr_reader :picks, :menu

  def initialize(menu)
    @picks = []
    @menu = menu
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
    return "Thanks your order it will be with you by #{DEL_TIME.hour}:#{DEL_TIME.min}"
  end

end
