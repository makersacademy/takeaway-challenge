require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { double :dish, name: 'Taco', price: 5}

  it 'should initialize with an empty array of dishes' do
    expect(menu.dishes).to be_empty
  end
end
