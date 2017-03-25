class Menu

  attr_reader :mains, :desserts

  def initialize
    @mains = [{1 => "Lasagna", "price:" => "£10"}, {2 => "Burger", "price:" => "£5"}]
    @desserts = [{1 => "Icecream", "price:" => "£5"}, {2 => "Cake", "price:" => "£3"}]
  end

  def add_main(main)
    mains << {(mains.length + 1) => main}
  end

end
