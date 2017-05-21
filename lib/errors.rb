
class MenuError < StandardError
  def initialize(error_message = "The dish number you've selected doesn't exist!")
    super
  end
end


class OrderTotalError < StandardError
  def initialize(error_message = 'Your expected total differs from the calculated total!')
    super
  end
end