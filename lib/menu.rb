class Menu
attr_reader :meals

def initialize
  @meals = {
    Tacos: 6,
    Quesadillas: 5,
    Torta: 4,
    Burrito: 3
  }
end
end
