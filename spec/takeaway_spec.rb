require 'takeaway'
require 'menu'
require 'order'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:new_order) {double :new_order}
  let(:menu_item1) {double :menu_item1, :menu => {num: 1, name: "Milano", price: 19.99}}
  let(:menu_item2) {double :menu_item2, :menu => {num: 2, name: "American Hot", price: 16.99}}

  it 'should be initialized with a menu' do
    expect(takeaway.order).to be_an_instance_of(Order)
  end

  describe '#menu_list' do
    it 'show the menu' do
      expect(STDOUT).to receive(:puts).exactly(takeaway.order.menu.menu.count).times
      takeaway.menu_list
    end

  end

  describe '#choose_item' do

    it 'should take 1 argument' do
      expect(takeaway).to respond_to(:choose_item).with(1).argument
    end

    it 'should allow customer to choose an item from the menu' do
      takeaway.choose_item(menu_item1.menu[:num])
      expect(takeaway.order.selection).to include({num: 1, name: "Milano", price: 19.99})
    end
  end

  describe '#order_info' do
    before do
      takeaway.choose_item(menu_item1.menu[:num])
      takeaway.choose_item(menu_item2.menu[:num])
    end

    it 
  end
end
