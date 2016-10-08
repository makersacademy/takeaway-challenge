require 'menu'

describe Menu do
  let(:price) { double :price }
  let(:burrito) { double :burrito }
  let(:enchiladas) { double :enchiladas }
  subject(:menu) { described_class.new({ burrito=>price, enchiladas=>price })}

  it 'stores a list of dishes' do
    expect(menu.dishes).to include(burrito, enchiladas)
  end

  it 'can return a dish\'s price' do
    expect(menu.dishes[burrito]).to eq price
  end

end
