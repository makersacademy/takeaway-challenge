require 'takeaway.rb'

describe Takeaway do
  let(:sms_obj) { double :sms }
  subject(:takeaway) { described_class.new(menu_obj) }
  let(:menu_arr) { double('list of menu') }
  let(:dish) { double(:menu) }
  let(:quantity) { double(:menu) }
  let(:menu_obj) { double :menu }
  let(:hash_keys) { [:dish, :price, :quantity] }

  describe 'initialize' do
    it 'intializes the menu' do
      expect(takeaway.customer_order).to eq([])
    end
  end

  describe 'show_menu' do
    it 'shows the dishes with prices' do
      allow(menu_obj).to receive(:show_menu).and_return('list of dishes with prices')
      takeaway.show_menu
      menu_obj.show_menu
    end
  end

  describe '#ready_to_order' do
    it 'allows customers to select one of the available dishes' do
      allow(menu_obj).to receive(:show_menu).and_return('list of dishes with prices')
      takeaway.show_menu
      menu_obj.show_menu
      list_of_dishes = [{ dish: 'pasta', price: 10.00, quantity: 4 }]
      allow(menu_obj).to receive(:select_dishes).and_return(list_of_dishes)
      allow(takeaway).to receive(:ready_to_order).and_return(list_of_dishes)
      allow(takeaway).to receive(:verify_order).with(list_of_dishes).and_return('list of dishes and total sum of the ordered dishes')
    end
  end

  describe '#verify_order' do
    it 'it verifies the total matches the sum of the various dishes in my order' do
      takeaway = Takeaway.new
      menu_obj = Menu.new
      takeaway.show_menu()
      expect(menu_obj.show_menu).to eq(menu_obj.menu)
      takeaway.ready_to_order
      expect(menu_obj).to receive(:select_dishes)
      menu_obj.select_dishes
      expect { takeaway.ready_to_order }.to change { takeaway.customer_order }
      takeaway.customer_order.each { |hash| expect(hash.keys).to contain_exactly(*hash_keys) }
      expect(takeaway).to receive(:verify_order).with(takeaway.customer_order)
      takeaway.verify_order(takeaway.customer_order)
      expect(takeaway.total).to eq(takeaway.customer_order.map { |item| item[:price] * item[:quantity] }.reduce(:+))
    end

  end

  describe 'complete_order' do
    it 'raises error when total does not match the sum of the ordered dishes' do
      allow(takeaway).to receive(:is_price_correct?).and_return(false)
      expect(takeaway.complete_order(takeaway.total)).to eq 'Sum does not match the total sum of the dishes ordered.'
    end

    it 'sends sms to the customer' do
      allow(takeaway).to receive(:is_price_correct?).and_return(true)
      expect(takeaway.complete_order(takeaway.total)).to eq 'send sms to the customer'
      expect(sms_obj).to receive(:send_message).with("Thank you for your order: your total is £25.50")
      sms_obj.send_message("Thank you for your order: your total is £25.50")
    end

  end

end
