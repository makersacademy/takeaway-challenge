class Menu 
  attr_reader :list
  
  def initialize 
    @list = {
      :pizza => 8.99,
      :noodles => 6.99,
      :chips => 3.99,
      :curry => 7.99
    }
  end
end
