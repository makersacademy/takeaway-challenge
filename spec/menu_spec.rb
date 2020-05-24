require_relative '../lib/menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }
  let(:dishes) { [{ pizza: 5.00, kebab: 4.00 }] }
  
  it 'should have a list of dishes and their prices' do
    expect(menu.dishes).to eq(dishes)
  end 

end