module Total

 def calculate_total
   prices = []
   contents.each {|menu_item| prices << menu_item[:price]}
   total = prices.inject{|memo, num| memo + num}
 end
end
