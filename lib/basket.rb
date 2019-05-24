# Keeps track of shopper's current menu choices
class Basket
  attr_reader :contents

  def initialize
    @contents = []
  end
  
  def add(menu)
    menu.selection.each { |entry|
      @contents << entry
    }
  end
end