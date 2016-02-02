module MenuList
  MENULIST = {
    :burger => {:Hamburger => 4.50, :Cheeseburger => 4.60, :Chips => 1.00 },
    :wine => {:red => 3.00, :white => 3.00, :blue => 10.00},
}

  def select(menu_type)
    MENULIST[menu_type]
  end

end
