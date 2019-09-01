require 'takeaway'

describe Takeaway do

  describe 'menu integration' do

    let(:menu_1){ double :menu_1 }
    subject(:takeaway) { described_class.new(menu_1) }

    it 'initializes with a menu' do
      expect(subject.menu).to eq(menu_1)
    end

    it 'shows menu' do
      allow(menu_1).to receive(:show_menu).and_return 'test'
      expect(subject.read_menu).to eq('test')
    end
  end
end 