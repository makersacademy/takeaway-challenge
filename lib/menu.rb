class Menu

  attr_reader :menu_contents, :header, :formatted_menu

  def initialize(menu)
    @menu_contents = menu
    @header = "--Menu--"
    @formatted_menu = []
  end

  def format_menu_contents
    @menu_contents.each do |key, value|
      @formatted_menu << "#{key}: £#{value.to_f}"
    end
  end

  def view
    puts @header
    puts @formatted_menu
  end

end
