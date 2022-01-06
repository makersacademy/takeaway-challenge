class Menu


 def initialize 
  @menu = items
 end

 def items 
  items = [
    {pasta: 6},
    {pizza: 10},
    {ramen: 7},
    {soup: 3},
  ]
  items
 end

 def print_menu
  puts "Tom's Takeaway-"
  @menu.each do |key, valueß|
    key.each do |k, v|
      puts "#{k}:" + " £#{v}"
    end
  end

 end

end