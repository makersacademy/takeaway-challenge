require 'menu'

describe Menu do
  let(:menu){described_class.new}

  describe '#read' do
    it 'will display menu' do
      expect(menu.read["fu-king fried rice"]).to eq(5.99)
    end
  end
end
