class Menu
  
  def dishes
    {:Fries => 2,
     :Pizza => 5,
     :Burger => 3,
     :Kebab => 4}
  end
                                        # If I had more time, I would have put the view_menu method inside a takeaway/restaurant class.
  def view_menu                         # I realise this method is a tad pointless as it stands...
    dishes.each_with_index do | (item, price), index |
    "#{index + 1}: #{item} | Cost: £#{price}"
    end
  end
end