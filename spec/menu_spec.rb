require 'menu'

describe Menu do
  let(:subject) { described_class.new }

  describe '#dispay_menu' do
    it { is_expected.to respond_to(:display_menu) }

    it 'displays the menu' do
      expect(subject.display_menu).to eq Menu::MENU
    end
  end
end
