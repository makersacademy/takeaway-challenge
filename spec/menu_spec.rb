require 'menu'

describe Menu do
  let(:menu) { described_class.new }

  it 'allows customers to view a menu pricelist' do
    expect{ menu.pricelist }.not_to raise_error
  end
end
