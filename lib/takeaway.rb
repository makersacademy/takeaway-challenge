class TakeAway
attr_reader :menu
  def initialize()
    @menu = Menu.new
  end

  def seemenu
    return [{ "dimsum" => 3 }, { "soup" => 4 }, { "noodles" => 6 }, { "rice" => 7 }]
  end

  def order
  end

end
