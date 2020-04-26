require  'menu'

RSpec.describe Menu do 

  subject(:menu) { described_class.new(dishes)}

  let(:dishes) do {
    pizza: 5.50,
    fish: 6.75
  }
end

  it 'has a list of dishes' do
    expect(menu.dishes).to eq dishes
  end

end