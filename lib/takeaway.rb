class Takeaway

  attr_reader :menu

  def initialize
    @menu = {
      :pizza => 5.00,
      :chips => 2.00,
      :kebab => 3.50,
      :burger => 3.50,
      :sushi => 5.00,
      :fried_chicken => 3.00
      }
  end

end
