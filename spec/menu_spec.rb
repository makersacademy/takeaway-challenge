require 'menu'

describe Menu do
  context 'Loading a menu of items' do
    describe '#add_dish' do
      it "Should produce an array of hashes with menu items and prices" do
        subject.add_dish("Pizza", 5)
        expect(subject.dishes).to eq [{ :dish => "Pizza", :price => 5 }]
      end
    end
    describe '#load_menu' do
      xit "Should load a list of dishes from a CSV file" do
        # expect(subject).to receive(:load_menu).with("menu_items.csv").and_return('Pizza',5)
        subject.load_menu("menu_items.csv")
        expect(subject.dishes).to eq [{ :dish => "Pizza", :price => 5 }]
      end
    end
  end
end
