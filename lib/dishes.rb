class Dishes

attr_reader :list

  def initialize
    @list = { pie: 2.95,
              cod: 6.00,
              haddock: 6.25,
              fishcake: 2.25,
              sausage: 1.60,
              chips: 2.20,
              scampi: 6.10 }
  end

end
