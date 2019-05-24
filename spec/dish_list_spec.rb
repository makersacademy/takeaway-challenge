require './lib/dish_list.rb'

describe DishList do

let(:dishes) { DishList.new }

  it 'can show all dishes with prices' do
    expect(dishes.dish_list_prices).to eq(
                        { spaghetti_bolognese: 30,
                          chicken_pesto: 44,
                          fettuccine_beef: 42,
                          chilli_chicken: 45,
                          sabor_salad: 32,
                          tiramisu: 15,
                          banoffee_pie: 15
                        })
  end


end
