class Menu

attr_accessor :list

  def initialize
    @list = []
  end

  def add_item(item, price)
    @list << {item => '%.02f' % price}
  end

end
