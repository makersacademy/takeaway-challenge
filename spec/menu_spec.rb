require 'menu'

describe Menu do
  
  subject(:menu) { described_class.new }
  let(:dishes) { { beef_burger: '1.99',  cheese_burger: '1.99', chicken_wings: '0.49', coke: '0.99' } }
  
  
  it 'contains a list of dishes' do
    expect(menu.dishes).to eq dishes
  end

end