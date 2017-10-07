class Takeaway

attr_reader :menu

  def initialize
    @menu = {"Spring Rolls" => 4}
    welcome_message
  end

  def view_menu
    menu
  end

  private

  def welcome_message
    puts "Welcome to Tim's Thai"
  end

end
