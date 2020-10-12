require './lib/order'
describe Order do
  context '#add' do
    it 'add items from the menu to the order' do
      expect { subject.add("item", 20, 1) }.to(change { subject.order })
    end

    it "shows the total of the order" do
      subject.add("Meatballs", 26, 1)
      subject.add("Canelloni", 22, 1)
      subject.add("Kebap", 18, 1)
      expect(subject.total_items).to eq 66
    end    
  end
end
