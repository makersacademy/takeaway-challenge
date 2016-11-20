require 'restaurant'

describe Restaurant do

  let(:restaurant) {described_class.new}
  example_order = [ { "Diavola" => 1, "Capricosa" => 2 }, 27.45 ]

  it 'shows the list of pizzas' do
    expect{restaurant.print_menu}.to output(restaurant.print_menu).to_stdout
  end

  it 'returns a the price of a pizza' do
    expect(restaurant.pizza["Marinara"]).to eq 5.95
    expect(restaurant.pizza["Capagnola"]).to eq 9.95
  end

  it 'creates a new Order' do
    restaurant.create_order(example_order)
    expect(restaurant.new_order.meal).to eq({ "Diavola" => 1, "Capricosa" => 2 })
  end


end
