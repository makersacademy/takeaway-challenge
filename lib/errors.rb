
class MenuError < StandardError
  def initialize(error_message = "The dish number you've selected isn't on the menu!")
    super
  end
end


class OrderTotalError < StandardError
  def initialize(error_message = 'Your expected total differs from the calculated total!')
    super
  end
end
