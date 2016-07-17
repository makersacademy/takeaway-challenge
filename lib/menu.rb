require 'yaml'
require_relative 'dish'

class Menu
  def initialize(filepath = default_filepath)
    @dishes = YAML.load(File.read(filepath))
  end

private

  def default_filepath
    File.dirname(__FILE__)+'/../docs/dishes.yml'
  end
end
