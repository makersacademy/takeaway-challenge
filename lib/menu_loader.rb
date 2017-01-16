#understands how to read data stored in a YAML file and add it to menu
module MenuLoader
  def self.load menu, yaml_parser = YAML, file_reader = File
    menu_file = menu.menu_location
    data = yaml_parser.load(file_reader.open(menu_file))
    data.each{|item| menu.add_to_menu item}
  end
end
