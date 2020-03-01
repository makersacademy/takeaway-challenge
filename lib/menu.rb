menu_items =[
  {:item => "Garlic Bread", :price => 5},
  {:item => "Dips", :price => 3},
  {:item => "Margherita", :price => 7},
  {:item => "Frutti di Mare", :price => 11},
  {:item => "Romana", :price => 10},
  {:item => "Americana", :price => 11},
  {:item => "Padana", :price => 9},
  {:item => "Calzone", :price => 12},
  {:item => "Diavola", :price => 12}
]

class Menu
attr_reader :menu_items
  def initialize
    @menu_items = [
    {:item => "Garlic Bread", :price => 5},
    {:item => "Dips", :price => 3},
    {:item => "Margherita", :price => 7},
    {:item => "Frutti di Mare", :price => 11},
    {:item => "Romana", :price => 10},
    {:item => "Americana", :price => 11},
    {:item => "Padana", :price => 9},
    {:item => "Calzone", :price => 12},
    {:item => "Diavola", :price => 12}
    ]
  end

  def view_menu
  end

end
