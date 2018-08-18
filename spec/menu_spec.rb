require 'main'

describe Menu do
  let(:subject) { described_class.new('menu') }

  describe '#view_menu' do
    it 'returns the list of dishes and prices' do
      expect(subject.view_menu).to eq(subject.menu_list)
    end
  end
end
