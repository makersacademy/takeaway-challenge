require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes_list) }

  let(:dishes_list) do
    {
      steak: 12.00,
      halibut: 10.00
    }
  end

  it 'has a list of dishes and prices' do
    expect(menu.dishes_list).to eq(dishes_list)
  end
end
