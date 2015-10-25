require 'takeaway'


describe Takeaway do
  let(:menu) { double :menu, total: 10 , view_basket: anything}
  let(:twilio) { double :twilio, messages: messages }
  let(:messages) {double :messages, create: 'Foo' }
  subject { described_class.new(menu, twilio) }
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

  describe '#send_message' do
    it 'calls the twilio class and attempts to send a message' do
      expect(twilio).to receive(:messages)
      subject.send_message
    end
  end
end