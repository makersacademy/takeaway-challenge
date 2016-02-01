require 'operator'

describe Operator do

  let(:text) {double(:text)}
  let(:menu) {double(:menu)}
  let(:order) {"steak, chips 3, pizza 2"}
  let(:menu_string) {double(:menu_string)}
  let(:message) {"requesting menu please"}
  subject(:operator) {described_class.new(menu, text)}

  before(:example) do
    allow(text).to receive(:new_message).and_return(message)
    allow(text).to receive(:send_text)
    allow(menu).to receive(:food).and_return(menu_string)
    allow(menu).to receive(:create_receipt)
  end

  it 'should be able to check for new incoming text messages' do
    expect(operator.check_new_messages).to eq message
  end

  it {is_expected.to respond_to(:action)}

  it 'can recognise if a customer is requesting a menu' do
    operator.check_new_messages
    expect(operator.request_menu?).to be true
  end

  it 'can sort an incoming order' do
    expect(operator.sort_order(order)).to eq({:steak=>1,:chips=>3,:pizza=>2})
  end

  it 'can send a menu to a customer when necessary' do
    expect(operator.send(menu))
  end

  it 'can create a confirmation message' do
    operator.sort_order(order)
    expect(operator.confirmation_message).to be_instance_of String
  end

end
