require_relative 'order'

class Menu

  attr_reader :menu, :current_order


  def initialize
    @menu = [{"wing" => 0.99}, {"burger" => 1.99}, {"banana" => 30.33}]
  end



  def prices
    menu
  end


end
