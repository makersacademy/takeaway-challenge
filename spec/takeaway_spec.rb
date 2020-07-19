require './lib/takeaway'

describe Takeaway do

  describe '#view_menu' do
     it "returns the menu" do
     expect(subject.view_menu).to be_an(Array)
    end
  end

  describe '#add_to_basket' do
    it 'adds an item to item list in basket instance' do
      item = Menu.new.items[0]
      subject.add_to_basket(item)
      expect(subject.current_basket.items).to include(item)
    end
  end
end

