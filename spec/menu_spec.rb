require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'should be initialised with menu displaying item and price' do
    expect(menu.dishes.length).to eq 5
  end

end
