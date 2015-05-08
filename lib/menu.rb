require 'json'

class Menu
  attr_reader :menu
  def initialize
    file = File.read(File.expand_path("../../menu.json", __FILE__))
    @menu = JSON.parse(file)
  end
end
