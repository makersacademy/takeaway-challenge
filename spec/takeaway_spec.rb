require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }

  describe '#add_to_cart' do
    it 'select a number of dishes to order' do
      expect(subject).to respond_to(:add_to_cart).with(2).arguments
    end

    it 'raise error if item not on menu' do
      expect { subject.add_to_cart("Cheese Toast", 3) }.to raise_error "Item not on menu"
    end
  end

  before do
    subject.add_to_cart("Vegemite Toast", 2)
  end
    
  it 'shows list of dishes and prices on menu' do
    expect(subject.see_menu).not_to be_empty
  end 

  it 'allows user to add dishes to cart' do
    expect(subject.your_order).to eq ["2 x Vegemite Toast = £8"]
  end
  
  it 'views cart with total cost and ordered food' do
    expect(subject.total_cost).to eq 8
  end
  
end
