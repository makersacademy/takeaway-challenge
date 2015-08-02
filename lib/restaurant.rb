class Restaurant

  attr_reader :current_menu

  def initialize options
    @menu = options[:menu]
    @menu_content = options[:options]
    populate_menu
  end

  def populate_menu
    @current_menu = @menu.new(@menu_content)
  end

  def check_order order
  end

end


