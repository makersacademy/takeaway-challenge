require_relative 'menu_item'

class Menu
  attr_reader :contents

  def initialize
    @contents = []
  end

  def add(item)
    contents.push item
  end

  def view
    list_contents
  end

  private
  def list_contents
    contents.each { |item| puts "#{item.title}: #{item.price}" }
  end
end
