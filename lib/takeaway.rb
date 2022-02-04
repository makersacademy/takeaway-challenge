class Takeaway

  def initialize(dishes = [{pizza: '£9'}, {pasta: '£7'}])
    @dishes = dishes
  end

  def menu
    puts @dishes
    @dishes
  end

end