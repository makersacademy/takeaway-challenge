class DishesList

  attr_reader :menu

  def initialize
    @menu = [
      { :name => "sushi festival", :price => 3 },
      { :name => "chicken teriyaki dragon roll", :price => 4 },
      { :name => "salmon & avo dragon roll", :price => 5 },
      { :name => "spicy tuna dragon roll", :price => 5 },
      { :name => "veggie dragon roll", :price => 6 }
    ]
  end

  def view_list
    @menu
  end

end
