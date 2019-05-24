
require './lib/order.rb'

describe Order do

  let(:order) { Order.new }

  it 'can show all dishes with prices' do
    order
    expect(order.view_dishes).to eq( { spaghetti_bolognese: 30,
                          chicken_pesto: 44,
                          fettuccine_beef: 42,
                          chiili_chicken: 45,
                          sabor_salad: 32,
                          tiramisu: 15,
                          banoffee_pie: 15
                        })
  end




end
