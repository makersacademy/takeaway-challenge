require 'takeaway'
require 'customer'
describe 'Features' do
  let(:takeaway) { Takeaway.new }
  let(:customer) { Customer.new }  
  describe '#menu' do
    it { expect(takeaway.menu).not_to be_empty }
  end

  describe '#ordering' do
    it { expect(customer).to respond_to(:select_item) }
#    it 'adds an item to an order' do
#      customer.select_item :Burger, 1
#      expect(takeaway.order).to eq [{:burger => 4}]
#    end
    it { expect(customer).to respond_to(:selection) }   
  end
  
  describe '#customer' do
    it { expect(customer).to respond_to(:check_menu) }
      
  end
end