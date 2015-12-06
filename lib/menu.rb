class Menu

  attr_reader :list

  def initialize
    @list = { pizza: 6,
              chips: 3,
              cake: 4 }
  end
end
