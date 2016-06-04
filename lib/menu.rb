# contains menu data

class Menu

  attr_reader :menu

  def initialize
    @menu = [{:name => "Pilau Rice", :price => 2.20},
                   {:name => "Egg Fried Rice", :price => 2.50}]
  end

end
