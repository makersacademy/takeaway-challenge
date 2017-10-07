class Takeaway

  attr_reader :menu

  def initialize
    @menu = Dishes.new
  end

end
