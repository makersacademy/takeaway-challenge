require 'takeaway-challenge'

describe Takeaway do
  it { is_expected.to be_kind_of(Takeaway) }

  describe 'Ordering' do
    it 'allows a customer to see the menu' do
      expect(subject.see_menu).to eq(@menu) 
    end

    it 'allows a customer to add items from the menu to their order' do
      expect(subject.place_order(1)).to include (subject.customer_order[0])
    end
  end 

  context 'places an order' do
    before(:each) {subject.place_order(1)}

    describe 'order confirmation' do 
      it 'Calculates the correct customers bill' do
        expect(subject.bill).to eq(subject.menu[0][:price])
      end 
    end
  end  
end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered