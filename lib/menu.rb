class Menu

  def initialize
    @menu = { 'spring rolls' => 1.99, 'prawn toast' => 1.99,
       'egg fried rice' => 2.50, 'kung po chicken' => 4.50 }
  end 

  def read
    @menu.dup
  end

end
