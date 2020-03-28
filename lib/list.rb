class List
  attr_reader :menu
  def initialize
    @menu = { 'apple' => 3 }
  end
  def see
    @menu
  end
  def method_missing(m, *args, &blk)
    if @menu.has_key?(m.to_s)
      @menu
    else
      'We do not have that on the menu'
    end
  end
end