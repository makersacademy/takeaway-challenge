class Option
  attr_reader :dishes, :meal

  def initialize(dishes)
    @meal = []
    @dishes = dishes
  end

  def add_option(selection)
    @dishes.menu.each do |m|
      @dishes << m if m[:name] == selection
    end
  end
 end
