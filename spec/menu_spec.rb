require "menu"

describe Menu do

 let (:menu1) {Menu.new(dishes1)}

 let (:dishes1) do
    {chicken: 3.99,
      lamb: 5.99,
      beef: 7.99,
      camel: 9.99
    }
  end

  it "has a list of dishes and prices" do

    #or can do:
    #  dishes1 = {chicken: 3.99, lamb: 5.99, beef: 7.99, camel: 9.99}
    #menu1 = Menu.new(dishes1)
    
    expect(menu1.dishes). to eq (dishes1)
  end

  it "can print the dishes and prices" do

    printed_menu = "chicken: £3.99, lamb: £5.99, beef: £7.99, camel: £9.99"

    expect(menu1.print). to eq (printed_menu)
   
  end
end