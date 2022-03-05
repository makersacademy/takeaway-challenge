class Menu

  def initialize
    @dishes = [
      { olives: 2.5 },
      { brushetta: 5 },
      { pizza: 10 },
      { pasta: 12 },
      { risotto: 18 },
      { burger: 13 },
      { steak: 20 },
      { sole: 23 },
    ]
  end

  def list_dishes
    @dishes.clone
  end
end
