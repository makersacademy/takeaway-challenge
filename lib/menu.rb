class Menu
  # Holds everything related to the resturaunt's menu

  attr_reader :menu_items

def initialize
  @menu_items = {
    burrito: 6,
    quesadilla: 4,
    tacos: 5,
    corn: 2
  }

end

  def welcome
     "Welcome to Dan's Mexican Resturaunt."
  end

  def list_menu
       @menu_items.collect do |k,v|
        "#{k}        £#{v}"
     end
  end

end
