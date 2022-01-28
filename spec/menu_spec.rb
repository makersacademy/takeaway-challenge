require './lib/menu'

describe Menu do
  let(:menu) { Menu.new }
  
  it { is_expected.to respond_to(:dishes) }

  it 'can list of dishes with prices' do
    expect(menu.dishes).to eq({ "Burger" => "4.99", "Chips" => "1.50", "Pizza" => "7.99" })
  end

  it 'can print a list of dishes with prices' do
    expect(menu.print_dishes).to eq({ "Burger" => "4.99", "Chips" => "1.50", "Pizza" => "7.99" })
  end

  it 'can select a number of dishes' do
    expect(menu.order("Chips", "Burger")).to eq ["Chips", "Burger"]
  end
end
