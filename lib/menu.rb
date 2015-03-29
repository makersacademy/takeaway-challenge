require 'yaml'
class Menu
  attr_reader :items
  def initialize
    @items = {}
  end

  def load(yaml_file)
    items_from_yaml = YAML.load(File.read(yaml_file))
    @items.merge!(items_from_yaml)
  end
end
