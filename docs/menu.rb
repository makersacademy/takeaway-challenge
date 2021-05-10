class Menu

  #MENU = [{":dishnumber" => '1', ":dish" => 'Prawn Toast',
    #":price" => '2.50'}]

  MENUHASH = [{
    1 => 2.5,
    2 => 1.75,
    3 => 7.5,
    4 => 6.25,
    5 => 1.5,
    6 => 7.75,
    7 => 5.5 }]

  MENU = 
    "NI HAO MENU:

    Dish number: 1 | Prawn Toast - £2.50
    Dish number: 2 | Spring Rolls - £1.75
    Dish number: 3 | Chicken Chow Mein - £7.50
    Dish number: 4 | Crispy Chilli Beef - £6.25
    Dish number: 5 | Poppadom - £1.50
    Dish number: 6 | Sweet & sour chicken - £7.75
    Dish number: 7 | Salt & pepper tofu - £5.50"

    
  def show
    print MENU
  end
end