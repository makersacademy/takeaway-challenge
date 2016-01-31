module Menu

  attr_reader :view_menu

  STARTERS = {:soup => 1.50,
  :salad => 1.00,
  :scallops => 2.50}.freeze
  MAINS = {:steak => 7.50,
  :lasagne => 5.50,
  :lobster => 8.00 }.freeze
  DESSERTS = {:tiramisu => 2.50,
  :cheesecake => 2.00,
  :profiteroles => 1.50}.freeze
  SIDES ={:bread => 0.50,
  :chips => 1.50,
  :kimchi => 2.00}.freeze

  def initialize
    @view_menu = {}
    @view_menu.merge!(STARTERS).merge!(MAINS).merge!(DESSERTS).merge!(SIDES)
  end

  def starters
    STARTERS
  end

  def mains
    MAINS
  end

  def desserts
    DESSERTS
  end

  def sides
    SIDES
  end

end
