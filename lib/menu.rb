require 'yaml'

class Menu
  def initialize(filename = 'menu.yaml')
    @filename = filename
  end

  def display_menu
    yaml_load
  end

  def has_dish?(dish)
    display_menu.has_key? dish
  end

  private

  def yaml_load
    file_path = File.expand_path(@filename, File.dirname(__FILE__))
    yaml_string = File.read file_path
    YAML::load yaml_string
  end
end