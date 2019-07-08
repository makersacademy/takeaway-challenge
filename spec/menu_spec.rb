require 'menu'

describe Menu do

  subject(:menu) { described_class.new(food) }
  
  let(:food) do
    {
        cheesburger: 0.99,
        hamburger: 0.89
    }
  end

  it 'has a list of dishes with prices' do
    expect(menu.food).to eq(food)
  end

  it 'prints a list of dishes and prices' do
    printed_menu = "Cheesburger: £0.99, Hamburger: £0.89"
    expect(menu.print_list).to eq(printed_menu)
  end

end
