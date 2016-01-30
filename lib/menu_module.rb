module Menu

  attr_reader :starters, :mains, :desserts, :sides

  def initialize
    @starters = {:soup => 1.50,
    :salad => 1.00,
    :scallops => 2.50}.freeze
    @mains = {:steak => 7.50,
    :lasagne => 5.50,
    :lobster => 8.00 }.freeze
    @desserts = {:tiramisu => 2.50,
    :cheesecake => 2.00,
    :profiteroles => 1.50}.freeze
    @sides = {:bread => 0.50,
    :chips => 1.50,
    :kimchi => 2.00}.freeze
  end

  def view_menu
    [@starters, @mains, @desserts, @sides].freeze
  end

  def view_starters
    @starters
  end

  def view_mains
    @mains
  end

  def view_desserts
    @desserts
  end

  def view_sides
    @sides
  end

end
