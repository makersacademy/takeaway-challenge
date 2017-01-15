module MenuLoader
  def self.load menu
    menu_file = menu.menu_location
    data = YAML.load(File.open(menu_file))
    data.each{|item| menu.add_to_menu item}
  end
end
