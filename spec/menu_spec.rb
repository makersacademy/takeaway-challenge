require 'menu'

describe Menu do

  let(:menu) {described_class.new}

  it 'should show the list of pizzas' do
    expect{menu.print_menu}.to output(menu.print_menu).to_stdout
  end

  it 'should return a the price of a pizza' do
    expect(menu.pizza["Marinara"]).to eq 5.95
    expect(menu.pizza["Capagnola"]).to eq 9.95
  end




end
