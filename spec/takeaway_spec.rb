require 'takeaway'

describe Takeaway do
  let (:menu_instance) {double :menu_instance}
  let (:order_instance) {double :order_instance}
  let (:menu_item) {double :menu_item}
  let (:menu_item_2) {double :menu_item_2}
  subject {described_class.new(menu_instance, order_instance)}

  it{is_expected.to respond_to(:read_menu)}
  it{is_expected.to respond_to(:order)}
    it{is_expected.to respond_to(:basket)}

  it 'should be able to read a menu' do
    allow(menu_instance).to receive(:new).and_return(menu_instance)
    expect(menu_instance).to receive(:read).and_return(menu_instance)
    subject.read_menu
  end

  it 'should be able to place an order' do
    allow(order_instance).to receive(:select).and_return(menu_item)
    expect(subject.order(menu_item)).to eq(menu_item)
  end


end
