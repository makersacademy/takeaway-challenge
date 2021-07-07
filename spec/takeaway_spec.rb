require './lib/takeaway'

describe Takeaway do

  describe '#view_menu' do
     it "returns the menu" do
     expect(subject.menu).to be_an(Array)
    end
  end

  describe '#current_basket' do
    it "returns an instance of Basket" do
    expect(subject.current_basket).to be_an_instance_of(Basket)
   end
 end

  describe '#view_basket' do
    it 'returns an array' do
      expect(subject.view_basket).to eq([])
    end
  end

  describe '#add_to_basket' do
    it 'adds an item to item list in basket instance' do
      item = Menu.new.items[0]
      subject.add_to_basket(item)
      expect(subject.current_basket.items).to include(item)
      subject.add_to_basket(item)
      expect(subject.current_basket.items.count).to eq(2)
    end
  end

  describe '#view_basket_breakdown' do
    it 'shows basket with prices and total price' do
        item = Menu.new.items[0]
        subject.add_to_basket(item)
        expect(subject.view_basket_breakdown).to be(nil)
    end
  end

end

