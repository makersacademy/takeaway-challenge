require_relative 'list'
class Menu

  attr_reader :list

  def initialize(list = List.new.list)
    @list = list

  end

  def generator
    @list.join(" ")
  end

end
