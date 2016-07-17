require 'yaml'
require_relative 'dish'

class Menu
  attr_reader :dishes
  def initialize(filepath = default_filepath)
    @dishes = YAML.load(File.read(filepath))
  end

  def pick(selection)
    @dishes[(selection-1)].dup
  end

private

  def default_filepath
    File.dirname(__FILE__)+'/../docs/dishes.yml'
  end
end
