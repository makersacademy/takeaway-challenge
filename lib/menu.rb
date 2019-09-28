class Menu

  attr_reader :items

  @@menu_hash = {pizza: 3, pasta: 4}

def format_menu
  @@menu_hash.each do |x,y|

 puts "#{x} -- £#{y}"

  end
end


end