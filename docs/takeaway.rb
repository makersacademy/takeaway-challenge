class Takeaway
  attr_reader :menu

  def initialize 
    @menu = {
      beef_curry: 12, 
    }
  end

  def dishes


    return "#{:beef_curry}: £#{@menu.fetch(:beef_curry)}"
  end
end