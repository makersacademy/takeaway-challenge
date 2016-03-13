
class ItalianMenu

attr_reader :meal, :course

  def initialize(meal=:dinner, course=:all)
    @meal = meal
    @course = course
  end

  def dishes
    meal == :dinner ? dinner : lunch
  end


  def dinner
      starters = { Starters: 'Price',
        Calamari: 8,
        Olives: 4,
        Panzerottini: 7,
        Bruschetta: 6,
        Gamberi: 9,
        Insalata: 7 }
      mains = { Mains: 'Price',
        Margherita: 13,
        Pasta: 12,
        Risotto: 11,
        Calzone: 10,
        Carbonara: 12,
        Bolognese: 12,
        Gnocchi: 11 }
      desserts = { Desserts: 'Price',
        Tiramisu: 10,
        Gelato: 8,
        Frutti: 9,
        Tortoni: 9 }
    if course == :all
      starters.merge(mains).merge(desserts)
    else
      course == :starter ? starters : course == :main ? mains : desserts
    end
  end

  def lunch
      starters = { Starters: 'Price',
        Soup: 5,
        Frutti_de_mer: 9,
        Proscuitto: 7,
        Capocollo: 9 }
      mains = { Mains: 'Price',
        Focaccia: 10,
        Calzone: 10,
        Penne: 11,
        Margherita: 13,
        Lasagne: 13 }
      desserts = { Desserts: 'Price',
        Pannacotta: 7,
        Semi_fresso: 7,
        Tiramisu: 10}
    if all?
      starters.merge(mains).merge(desserts)
    else
     course == :starter ? starters : course == :main ? mains : desserts
    end
  end

  private

  def all?
    course == :all
  end

end
