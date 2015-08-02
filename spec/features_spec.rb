require 'takeaway'
require 'customer'
describe 'Features' do
  let(:takeaway) { Takeaway.new }
  let(:customer) { Customer.new }  
  describe '#menu' do
    it { expect(takeaway.menu).not_to be_empty }
  end

  describe '#customer' do 
    describe '#ordering' do
      it { expect(customer).to respond_to(:show_menu) }
      it 'adds an item to an order' do
        customer.order_item :Burger, 1
        expect(customer.order).not_to be_empty
      end
      it { expect(customer).to respond_to(:view_order) }   
    end
  end 
end