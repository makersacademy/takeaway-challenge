class Takeaway

  attr_reader :menu

  def initialize 
    @menu = { "pizza" => "£4.50", "chips" => "£2", 
    "kebab" => "£3" }
  end
end