require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  it 'returns a list of dishes and prices' do
    expect(menu).to respond_to(:read)
  end
end
