require 'takeaway'


describe Takeaway do
  let(:menu) { double :menu, total: 10 , view_current_order: anything}
  let(:twilio) { double :twilio, messages: 'blah' }
  subject { described_class.new(menu) }
  describe '#initialize' do
    it 'initializes with a menu' do
      expect(subject.menu).to eq menu
    end
  end

  describe '#add' do
    it 'calls the Menu#add method' do
      expect(menu).to receive(:add)
      subject.add("Pork Dumplings", 2)
    end
  end

  describe '#request_menu' do
    it 'calls Menu#view_menu' do
      expect(menu).to receive(:view_menu)
      subject.request_menu
    end
  end

  describe '#view_current_order' do
    it 'calls Menu#view_basket' do
      expect(menu).to receive(:view_basket)
      subject.view_current_order
    end
  end

  describe '#checkout' do
    it 'calls the send_message if the #confirm_order method is true' do
      allow(subject).to receive(:send_message).and_return("blah")
      expect(subject).to receive(:send_message)
      subject.checkout(10)
    end
  end

  describe '#'
end