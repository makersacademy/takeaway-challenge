require 'takeaway'

describe Takeaway do
  let(:menu) { spy :menu_double }
  let(:subject) {described_class.new(menu)}

  describe '#menu' do
    it 'should respond to #menu' do
      expect(subject).to respond_to(:menu)
    end
    it 'should send #display_menu to instance of Menu class' do
      subject.menu
      expect(menu).to have_received(:display_menu)
    end
  end

end
