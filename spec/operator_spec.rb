require 'operator'

describe Operator do

  let(:text) {double(:text)}
  let(:menu) {double(:menu)}
  let(:random_message) {'hello'}
  let(:current_text) {"steak 1, chips 3, pizza 2"}
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

  context '#check_new_messages' do
    it 'should be able to check for new incoming text messages' do
      expect(operator.check_new_messages).to eq current_text
    end
  end

  context '#sort_order' do
    it 'can sort an incoming order' do
      # operator.check_new_messages
      expect(operator.sort_order(current_text)).to eq({:steak=>1,:chips=>3,:pizza=>2})
    end
  end

  context '#confirmation_message' do
    it 'can create a confirmation message from the order information hash' do
      operator.check_new_messages
      order_information = operator.sort_order(current_text)
      time = operator.arrival_time
      expect(operator.confirmation_message(order_information)).to include "Thank you for placing your order of:\n1x steak\n3x chips\n2x pizza\nTotal cost: £44\nIt will arrive at #{time}"
    end
  end

  context '#sent_menu' do
    it 'can send a menu' do
      expect(text).to receive(:send_text)
      operator.send_menu
    end
  end

  context '#order_online' do
    it 'can place an order through irb, thus removing need to text in order' do
      expect(operator.order_online("steak 1, chips 3, pizza 2")).to eq current_text
    end
  end

  context '#send' do
    it 'can sent any required message' do
      expect(text).to receive(:send_text)
      operator.send(random_message)
    end
  end

  context '#menu' do
    it 'can view a menu in irb' do
      expect(menu).to receive(:food)
      operator.request_menu
    end
  end

  # describe '#automatic' do
  #   it 'can automatically take an order and reply with a confirmation' do
  #     operator.check_new_messages
  #     operator.automatic
  #     expect(operator.sort_order(current_text))
  #     expect(operator.confirmation_message({:steak=>1,:chips=>3,:pizza=>2}))
  #     expect(operator.send(random_message))
  #   end
  # end

  it {is_expected.to respond_to(:automatic)}

  context '#action' do
    it 'raises an error when there has been no check for a new message' do
      expect{operator.action}.to raise_error 'You have not checked the inbox'
    end
  end


end
