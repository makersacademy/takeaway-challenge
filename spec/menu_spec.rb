require 'menu'

describe Menu do
let(:menu) { [
  { item_code: 1, item: "cod", price: 5 },
  { item_code: 2, item: "haddock", price: 5 },
  { item_code: 3, item: "small chips", price: 1 },
  { item_code: 4, item: "large chips", price: 2 },
  { item_code: 5, item: "chicken pie", price: 3 },
  { item_code: 6, item: "steak pie", price: 3 },
  { item_code: 7, item: "sausage", price: 1 },
  { item_code: 8, item: "battered sausage", price: 1 },
  { item_code: 9, item: "curry sauce", price: 1 },
  { item_code: 10, item: "mushy peas", price: 1 }
]}

  describe '#new' do
    it 'initializes with the current takeaway menu' do
      expect(subject.menu).to include({:item_code=>1, :item=>"cod", :price=>5})
      expect(subject.menu).to include({:item_code=>10, :item=>"mushy peas", :price=>1})
    end
  end

  describe '#view' do

    it 'shows the full menu' do
      # menu = subject.menu
      expect(subject.menu).to eq(menu)
    end
  end

end
