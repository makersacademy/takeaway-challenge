class Menu
  
  def dishes
    {:Fries => 2,
     :Pizza => 5,
     :Burger => 3,
     :Kebab => 4}
  end
end  

=begin
  This method is to be included on takeaway.rb (once created), as opposed to menu.rb!
  
  def view_menu
    dishes.each_with_index do | (item, price), index |
    puts "#{index + 1}: #{item} | Cost: £#{price}"  
    end
  end
=end