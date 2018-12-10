class MenuDisplayer

  require_relative "./menu.rb"

  attr_reader :menu

  def initialize
    menu = Menu.new
    @menu = menu
  end

  def display
    @menu.list.each_with_index { |item, index|
      p "#{index + 1}.#{item[:item]}:£#{item[:price]}"
    }
  end

end
