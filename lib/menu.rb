class Menu

  MENU = {1 => {:Pizza => 7}, 
          2 => {:Pasta => 6}, 
          3 => {:Beer => 4}}

def initialize

end

def list_items

MENU.each{ |key, value| value.each {|item, price| "#{key}: #{item}, #{price}"}}
end

def item(selection)
  MENU[selection]
end

end