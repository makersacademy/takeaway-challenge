require 'takeaway'

describe Takeaway do
  subject { described_class.new(menu) }
  let(:menu) { double :menu }

  describe '#initialize' do
    it 'has a menu' do
      expect(subject).to respond_to(:menu)
    end
  end

  describe '#see_menu' do
    it 'shows items on a menu' do
      expect(menu).to receive(:print_menu)
      subject.see_menu
    end
  end

end
