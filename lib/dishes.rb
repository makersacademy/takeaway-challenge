class Dishes

  attr_reader :menu

  def initialize
    @menu = [
      { :name => "sushi festival", :price => 3 }
    ]
  end

  def view_list
    @menu
  end

end
