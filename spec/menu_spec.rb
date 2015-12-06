require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'has a list of dishes' do
    expect(menu.list).to eq(pizza: 6,
                            chips: 3,
                            cake: 4)
  end
end
