require 'menu'

describe Menu do

  subject(:menu) { described_class.new(food) }
  
  let(:food) do
    {
        cheesburger: 0.99,
        hamburger: 0.89,
        fanta: 0.89,
        fries: 0.89,
        sundae: 0.99
    }
  end

  it 'has a list of dishes with prices' do
    expect(menu.food).to eq(food)
  end

  it 'prints a list of dishes and prices' do
    printed_menu = "Cheesburger: £0.99, Hamburger: £0.89, Fanta: £0.89, Fries: £0.89, Sundae: £0.99"
    expect(menu.print_list).to eq(printed_menu)
  end

end
