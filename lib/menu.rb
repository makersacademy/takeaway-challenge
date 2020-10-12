class Menu
  attr_reader :list
    
  def initialize
    @list = {
      :shawarma => "£5",
      :chips => "£3",
      :salad => "£2",
      :pepsi => "£1"
    }
  end

end