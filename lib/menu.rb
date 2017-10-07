
class Menu

  attr_reader :tapas, :alcoholc_drinks, :dessert

  def initialize
    @tapas = {
      "Gordal Olives" => 6.75,
      "Gazpacho Andaluz" => 6.00,
      "Croquestas de Jamon" => 7.00,
      "Seleccion de Ibericos" => 23.00,
      "Seleccion de Queso" => 16.75,
      "Tortialla Espanola" => 5.00,
      "Huevos Rotos" => 8.75,
      "Patatas Bravas y alioli" => 5.00,
      "Gambas al Ajillo" => 9.75,
      "Arroz Negro" => 7.00
    }

    @alcoholc_drinks = {
      "Sangria" => 6.25,
      "Cava Sangria" => 6.75,
      "Cava" => 7.50,
      "Vino Tinto" => 6.50,
      "Vino Blanco" => 6.50,
      "Estrella" => 4.50,
      "Pedro Ximenez" => 8.65
    }

    @dessert = {
      "Arroz con Leche" => 5.00,
      "Tarta de Santiago" => 6.00,
      "Crema Catalana" => 6.00,
      "Homemade Ice Cream or Sorbet" => 4.25
    }
  end

  def print_menu
    print "\n Tapas:\n"
    @tapas.each { |key, value| print " #{key}   #{value} \n\n" }
    print "\n Alcoholc Drinks:\n"
    @alcoholc_drinks.each { |key, value| print " #{key}   #{value} \n\n" }
    print "\n Dessert:\n"
    @dessert.each { |key, value| print " #{key}   #{value} \n\n" }
  end
end
