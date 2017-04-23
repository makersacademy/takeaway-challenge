require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it { is_expected.to respond_to :dishes }

  describe '#view' do
    it 'displays the current dishes when viewing menu' do
      expect(menu.dishes).to eq menu.dishes
    end
  end
end
