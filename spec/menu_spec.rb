require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#view' do
    it 'shows the list of dishes with prices' do
      expect(menu.view).to eq menu.list
    end
  end
end
