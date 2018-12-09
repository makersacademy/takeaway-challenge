class Menu

  attr_reader :list

  def initialize
    @list = [{ Pizza: 8 },
      { Risotto: 12 },
      { Pasta: 10 },
      { Calzone: 9 },
      { Pannacota: 6 },
      { Gelato: 4 },
      { espresso: 2 },
      { capuccino: 3 }]
  end
end
