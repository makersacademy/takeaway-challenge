require 'order'

describe Order do
  

  describe '#add_item' do
    it { is_expected.to respond_to(:add_item).with(3).argument }
    
    it 'increases the total price when new item added' do
      expect { subject.add_item("Pizza", 12, 1) }.to change { subject.total }.by 12
    end
  end

  describe '#total_cost' do
    it 'shows the order total cost' do
      expect(subject.total_cost).to eq subject.total
    end 
  end

  describe '#view_basket' do
    it 'shows the items in the menu' do
    end
  end
   
end
