class Menu

  attr_reader :menu_contents, :header

  def initialize(menu)
    @menu_contents = menu
    @header = "--Menu--"
  end

  def format_menu_contents
    formatted_menu = []
    @menu_contents.each do |key, value|
      formatted_menu << "#{key}: £#{value.to_f}"
    end
    formatted_menu
  end

  def view
    puts @header
    puts format_menu_contents
  end

end
