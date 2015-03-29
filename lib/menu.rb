require 'yaml'
class Menu
  attr_reader :items
  def initialize(options = {})
    options.merge!(defaults)
    @items = yaml_to_hash(options[:menu])
  end

  def load(yaml_file)
    items_from_yaml = yaml_to_hash(yaml_file)
    @items.merge!(items_from_yaml)
  end

  def item(number)
    items[number]
  end

  private

  def defaults
    { menu: './menu.yml' }
  end

  def yaml_to_hash(yaml_file)
    YAML.load(File.read(yaml_file))
  end
end
