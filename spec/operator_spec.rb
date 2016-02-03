require 'operator'

describe Operator do

  let(:text) {double(:text)}
  let(:menu) {double(:menu)}
  let(:current_text) {"steak, chips 3, pizza 2"}
  let(:menu_string) {double(:menu_string)}
  #let(:message) {"requesting menu please"}
  subject(:operator) {described_class.new(menu, text)}

  before(:example) do
    allow(text).to receive(:new_message).and_return(current_text)
    allow(text).to receive(:send_text)
    allow(menu).to receive(:food).and_return(menu_string)
    allow(menu).to receive(:create_receipt).and_return(44)
  end

  it {is_expected.to respond_to(:send_menu)}

  describe '#check_new_messages' do
    it 'should be able to check for new incoming text messages' do
      expect(operator.check_new_messages).to eq current_text
    end
  end

  describe '#sort_order' do
    it 'can sort an incoming order' do
      operator.check_new_messages
      expect(operator.sort_order).to eq({:steak=>1,:chips=>3,:pizza=>2})
    end
  end

  describe '#confirmation_message' do
    it 'can create a confirmation message from the order information hash' do
      operator.check_new_messages
      order_information = operator.sort_order
      expect(operator.confirmation_message(order_information)).to eq "Thank you for placing your order of:\n1x steak\n3x chips\n2x pizza\nTotal cost: £44"
    end
  end



  # it {is_expected.to respond_to(:action)}

  # it 'can recognise if a customer is requesting a menu' do
  #   operator.check_new_messages
  #   expect(operator.request_menu?).to be true
  # end



  # it 'can send a menu to a customer when necessary' do
  #   expect(operator.send(menu))
  # end

  #make private ??
  # it 'can create a confirmation message' do
  #   operator.sort_order(order)
  #   expect(operator.confirmation_message(message)).to be_instance_of String
  # end

end
