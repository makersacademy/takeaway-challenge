module Menu

  attr_reader :view_starters, :view_mains, :view_desserts, :view_sides

  def initialize
    @view_starters = {:soup => 1.50,
    :salad => 1.00,
    :scallops => 2.50}.freeze
    @view_mains = {:steak => 7.50,
    :lasagne => 5.50,
    :lobster => 8.00 }.freeze
    @view_desserts = {:tiramisu => 2.50,
    :cheesecake => 2.00,
    :profiteroles => 1.50}.freeze
    @view_sides = {:bread => 0.50,
    :chips => 1.50,
    :kimchi => 2.00}.freeze
  end

  def view_menu
    [@view_starters, @view_mains, @view_desserts, @view_sides].freeze
  end

end
