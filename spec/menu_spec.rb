require 'menu'

describe Menu do
  let(:menu) { described_class.new }

  it 'has a default dishes list empty' do
    expect(menu.dishes).to be_empty
  end

  describe '#add_dish' do

  end

end
