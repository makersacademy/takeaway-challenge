class Takeaway
  attr_reader :menu, :basket

  def initialize
    @menu = {
      'bibimbap'=>10,
      'bulgogi'=>10,
      'naengmyeon'=>8
    }
    @basket = []
  end

end
