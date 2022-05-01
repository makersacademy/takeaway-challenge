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

  describe 'billing' do 
    it 'Calculates the customers bill' do
      subject.place_order(1)
      expect(subject.bill).to eq(subject.menu[0][:price])
    end 

    it 'verifies the bill is correct based on the customers order' do
    end 
  end 
end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my ordergit