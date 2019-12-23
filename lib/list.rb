class List
  ITALIAN = { :pizza => { margherita: 7.5, marinara: 6, nduja: 10, bufala: 10.5, parma: 11.5 },
  :pasta => { pomodoro: 8.5, bolognese: 12, gamberi: 16.5, lasagna: 14.5 },
  :main => { salmon: 17.25, milanese: 15, burger: 12.95 },
  :drink => { water: 3, coke: 3, red: 24.95, white: 22 }
  }

  attr_reader :list

  def initialize(list = ITALIAN)
    @list = list
  end
end
