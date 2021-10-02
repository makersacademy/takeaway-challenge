class Takeaway 
  attr_reader :menu

  def initialize
    @menu = [{:item => "Papaya Salad", :price => 5},
             {:item => "Spring Rolls", :price => 5},
             {:item => "Noodles with grilled meats", :price => 5}]
  end 

  def see_menu
    @menu
  end 
end 