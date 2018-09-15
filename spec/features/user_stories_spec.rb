#require 'takeaway.rb'

describe 'all user stories' do
  let(:sms_obj) { double :sms }
  subject(:takeaway) { Takeaway.new(menu_obj)}
  let(:menu_instance) { Menu.new }
  let(:menu_arr) { double('list of menu')}
  let(:dish) { double(:menu) }
  let(:quantity) { double(:menu) }
  let(:menu_obj) { double :menu }
  let(:hash_keys){ [:dish, :price, :quantity]}


  describe 'initialize' do
    it 'intializes the menu' do
      expect(takeaway.customer_order).to eq([])
    end
  end

  describe 'show_menu' do
    it 'shows the dishes with prices' do
      takeaway = Takeaway.new(menu_instance)
      takeaway.show_menu
      expect(menu_instance).to receive(:show_menu).and_return(menu_instance.menu)
      menu_instance.show_menu
    end
  end

  describe '#ready_to_order' do
    it 'allows customers to select one of the available dishes' do
      takeaway = Takeaway.new(menu_instance)
      takeaway.show_menu
      expect(menu_instance).to receive(:show_menu)
      menu_instance.show_menu
      takeaway.ready_to_order #ordered_dishes
      expect(menu_instance).to receive(:select_dishes)
      menu_instance.select_dishes
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
    describe 'sms is being sent to user with order information' do
      it 'sends sms to the customer' do
        allow(takeaway).to receive(:verify_order).with('list_of_dishes').and_return('send sms to the customer')
        expect(takeaway.verify_order('list_of_dishes')).to eq 'send sms to the customer'
        allow(sms_obj).to receive(:send_message).and_return("Hey friend!, You just sent an SMS from Ruby!")
        sms_obj.send_message
      end
    end
end
