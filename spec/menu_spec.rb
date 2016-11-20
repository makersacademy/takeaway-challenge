require 'menu'

describe Menu do

  let(:menu) {described_class.new}

  it 'shows the list of pizzas' do
    expect{menu.print_menu}.to output(menu.print_menu).to_stdout
  end

  it 'returns a the price of a pizza' do
    expect(menu.pizza["Marinara"]).to eq 5.95
    expect(menu.pizza["Capagnola"]).to eq 9.95
  end

  it 'responds to place order' do
    expect(menu).to respond_to :place_order
  end

  it 'saves an order' do
    new_order = { "Diavola" => 1, "Capricosa" => 2 }
    menu.place_order(new_order)
    expect(menu.order).to eq new_order
  end

end
