class Menu
  attr_reader :pizza, :hamburger, :curry, :chips, :cake

  def initialize
    @pizza = { pizza: 6 }
    @hamburger = { hamburger: 7 }
    @curry = { curry: 5 }
    @chips = { chips: 3 }
    @cake = { cake: 4 }
  end

  def list
    [ @pizza,
    @hamburger,
    @curry,
    @chips,
    @cake ].inject(&:merge)
  end

end
