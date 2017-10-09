
class Menu

  attr_reader :tapas

  def initialize
    @tapas = {
      "GORDAL OLIVES" => 6.75,
      "GAZPATCHO" => 6.00,
      "CROQUESTAS DE JAMON" => 7.00,
      "SELECCION DE IBERICOS" => 23.00,
      "SELECTION DE QUESO" => 16.75,
      "TORTIALLA ESPANOLA" => 5.00,
      "HUEVIS ROTAS" => 8.75,
      "PATATAS BRAVAS" => 5.00,
      "GAMBAS AL AJILLO" => 9.75,
      "ARROZ NEGRO" => 7.00
    }

  end

  def print_menu
    print "\n Tapas:\n"
    @tapas.each { |key, value| print " #{key}   #{value} \n\n" }
  end

end
