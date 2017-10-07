class Takeaway

attr_reader :menu

  def initialize
    @menu = {"Spring Rolls" => 4,
            "Crispy Prawns" => 5,
            "Pork Skewers" => 6,
            "Tom Yum" => 7,
            "Green Curry" => 7,
            "Chang Beer" => 2}
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
