require 'takeaway'

describe Takeaway do
  let (:menu_instance) {double :menu_instance}
  let (:order_instance) {double :order_instance}
  let (:messenger_instance) {double :messenger_instance}
  let (:menu_item) {double :menu_item}
  let (:menu_item_2) {double :menu_item_2}
  let (:text_message) {double :text_message}
  subject {described_class.new(menu_instance, order_instance, messenger_instance)}

  it{is_expected.to respond_to(:read_menu)}
  it{is_expected.to respond_to(:order)}
  it{is_expected.to respond_to(:basket)}
  it{is_expected.to respond_to(:summary)}
  it{is_expected.to respond_to(:qty_tracker)}
  it{is_expected.to respond_to(:confirm)}

  it 'should be able to read a menu' do
    allow(menu_instance).to receive(:new).and_return(menu_instance)
    expect(menu_instance).to receive(:read).and_return(menu_instance)
    subject.read_menu
  end

  it 'should be able to place an order' do
    allow(order_instance).to receive(:select).and_return(menu_item)
    expect(subject.order(menu_item)).to eq(menu_item)
  end

  it 'should be able to call the order basket' do
      allow(order_instance).to receive(:basket).and_return(menu_item)
      expect(subject.basket).to eq(menu_item)
  end
  it 'should be able to call the order summary' do
    allow(order_instance).to receive(:summary).and_return(menu_item)
    expect(subject.summary).to eq(menu_item)
  end
  it 'should be able to call the qty_tracker' do
    allow(order_instance).to receive(:qty_tracker).and_return(menu_item)
    expect(subject.qty_tracker).to eq(menu_item)
  end
  it 'should be able to call the messenger confirm menthod' do
    allow(messenger_instance).to receive(:confirm).and_return(text_message)
    expect(subject.confirm).to eq(text_message)
  end
end
