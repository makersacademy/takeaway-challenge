require 'takeaway'

describe Takeaway do

  context 'display menu' do
    let(:menu) { double :menu }
    let(:menuview_class) { double :menuviewclass, new: true }
    subject { described_class.new(menu, menuview_class) }

    it 'shows a list of dishes with prices' do
      expect(menuview_class).to receive(:new)
      subject.display_menu
    end
  end
end
