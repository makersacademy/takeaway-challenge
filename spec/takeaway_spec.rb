require 'takeaway.rb'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu_arr) { double('list of menu')}
  let(:dish) { double(:menu) }
  let(:quantity) { double(:menu) }
  let(:menu_obj) { double(:menu)}
  let(:hash_keys){ [:dish, :price, :quantity]}

  it { is_expected.to respond_to :show_menu }
  #it { is_expected.to respond_to :menu}
  # context 'customers need to see the menu first' do
  #   before :each do
  #     show menu
  #   end
  #
  #   describe 'select from menu' do
  #     it 'does something'
  #     expect()something
  #   end
  #
  #   describe 'check out' do
  #     it 'checks out'
  #   end
  #
  # end

  describe 'initialize' do
    it 'intializes the menu' do
      expect(takeaway.customer_order).to eq([])
    end
  end

  describe 'show_menu' do
    it 'shows the dishes with prices' do
      takeaway.show_menu
      expect(menu_obj).to receive(:show_menu)
      menu_obj.show_menu
      #allow(menu_obj).to receive(:show_menu).and_return('list of dishes with prices')
      #list_of_dishes = ['pasta', £20, 'Non-veg main mean']
      #expect(takeaway.show_menu).to eq(list_of_dishes)
    end
  end

  describe '#ready_to_order' do
    it 'allows customers to select one of the available dishes' do
      takeaway.show_menu
      takeaway.ready_to_order
      expect(menu_obj).to receive(:select_dishes)
      menu_obj.select_dishes
      expect { takeaway.ready_to_order }.to change { takeaway.customer_order }
      takeaway.customer_order.each { |hash| expect(hash.keys).to contain_exactly(*hash_keys)}
      expect(takeaway).to receive(:verify_order).with(takeaway.customer_order)#ordered_dishes
      takeaway.verify_order(takeaway.customer_order)
    end
  end

  # desribe '#verify_order' do
  #   it 'verifies the total matches the sum of the various dishes in my order' do
  #     takeaway.show_menu
  #     takeaway.ready_to_order
  #     takeaway.verify_order(takeaway.customer_order)
  #     takeaway.total =
  #   end
  # end

  # # describe 'order' do
  # #   it 'lets the customer select some number of several available dishes' do
  #     takeaway.show_menu
  #     takeaway.order(cust_order)
  #     expect { takeaway.order(cust_order)}.to raise_error
  #     if cust_order.not_include(takeaway.menu[:dish])
  #   end
  # end
end
