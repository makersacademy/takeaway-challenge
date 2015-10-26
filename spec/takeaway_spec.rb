require 'takeaway'

describe Takeaway do 

  let(:menu) { double :menu, dishes: { :dish_one => 1.00, :dish_two => 2.00 }, deliver_menu: :the_menu }
  subject(:takeaway) { described_class.new }

  context 'initialization' do
    # there is a default menu
    # there is a default SMS provider
  end

  context 'read_menu' do
    it{ is_expected.to respond_to :read_menu }

    # it 'sends a message to menu#deliver_menu' do
    #   expect(send(:menu)).to receive(:deliver_menu)
    #  # menu.deliver_menu
    #   takeaway.read_menu
    # end
  end
  
  context '#order' do
    it{ is_expected.to respond_to :order }
 
  # a new order object is created if one does not already exist

  # it 'sends a message to customer_order#add_items' do
  # end

  # it sends a message to menu.report_price

  end

# PRIVATE
#   context '#validate_order' do
#     it 'should accept orders from the menu' do
#       expect(takeaway.validate(:dish_one)).to eq (:dish_one)
#     end

#     it 'should reject orders that are not on the menu' do
#       expect {takeaway.validate(:dish_unknown,1)}.to raise_error "I'm sorry, that is not on the menu."
#     end
#   end

  context '#order_total' do
    it{ is_expected.to respond_to :order_total } 

    # it 'returns the total value of the order' do
    #   total
    # end
  end

  context '#basket' do
    it { is_expected.to respond_to :basket }

    # it 'should send a message to CustomerOrder.display.order'

  end

  context '#checkout' do
    it { is_expected.to respond_to :checkout }
  end

  context '#send_sms' do
    it { is_expected.to respond_to :send_sms }

    # it sends a message to TwilioSMS.send_sms
  end

end