require 'takeaway.rb'

describe Takeaway do
  #let(:sms_obj) { double :sms }
  subject(:takeaway) { described_class.new(menu_obj)}
  let(:menu_arr) { double('list of menu')}
  let(:dish) { double(:menu) }
  let(:quantity) { double(:menu) }
  let(:menu_obj) { double :menu }
  let(:hash_keys){ [:dish, :price, :quantity]}

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
      allow(menu_obj).to receive(:show_menu)
      takeaway.show_menu
  end

  describe '#ready_to_order' do
    it 'allows customers to select one of the available dishes' do
      allow(menu_obj).to receive(:show_menu)
      takeaway.show_menu
      # expect(menu_obj).to receive(:show_menu)
      # menu_obj.show_menu
      allow(menu_obj).to receive(:select_dishes)
      #takeaway.ready_to_order


      # menu_obj.select_dishes
      # expect { takeaway1.ready_to_order }.to change { takeaway1.customer_order }
      # takeaway1.customer_order.each { |hash| expect(hash.keys).to contain_exactly(*hash_keys)}
      # expect(takeaway1).to receive(:verify_order).with(takeaway1.customer_order)#ordered_dishes
      # takeaway1.verify_order(takeaway1.customer_order)
      # #allow(sms_obj).to receive(:show_menu)
      # allow(sms_obj).to receive(:send_message).and_return("Hey friend!, You just sent an SMS from Ruby!")
      # #sms_obj.send_message
    end
  end

  describe '#verify_order' do
    it 'it verifies the total matches the sum of the various dishes in my order' do

      takeaway = Takeaway.new
      menu_obj = Menu.new
      takeaway.show_menu() #menu{dishes => price}
      expect(menu_obj.show_menu).to eq(menu_obj.menu)
      takeaway.ready_to_order #ordered_dishes
      expect(menu_obj).to receive(:select_dishes)
      menu_obj.select_dishes
      expect { takeaway.ready_to_order }.to change { takeaway.customer_order }
      takeaway.customer_order.each { |hash| expect(hash.keys).to contain_exactly(*hash_keys)}
      expect(takeaway).to receive(:verify_order).with(takeaway.customer_order)
      takeaway.verify_order(takeaway.customer_order)
      expect(takeaway.total).to eq(takeaway.customer_order.map { |item| item[:price] * item[:quantity]}.reduce(:+))
    end

        # it 'raises error when total does not match' do
        #   takeaway = Takeaway.new
        #   menu_obj = Menu.new
        #   takeaway.show_menu() #menu{dishes => price}
        #   expect(menu_obj.show_menu).to eq(menu_obj.menu)
        #   takeaway.ready_to_order #ordered_dishes
        #   expect(menu_obj).to receive(:select_dishes)
        #   menu_obj.select_dishes
        #   expect { takeaway.ready_to_order }.to change { takeaway.customer_order }
        #   takeaway.customer_order.each { |hash| expect(hash.keys).to contain_exactly(*hash_keys)}
        #   expect(takeaway).to receive(:verify_order).with(takeaway.customer_order)
        #   takeaway.verify_order(takeaway.customer_order)
        #   takeaway.total != takeaway.customer_order.map { |item| item[:price] * item[:quantity]}.reduce(:+)
        #   expect(takeaway.verify_order(takeaway.customer_order)).to eq 'Sum does not match the total sum of the dishes ordered.'
        #
        # end    
  end
end
