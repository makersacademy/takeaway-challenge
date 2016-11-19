require 'order'

describe Order do

  subject(:order) {described_class.new(menu)}
  let(:menu) {double :menu, list: menu_list}
  let(:menu_list) {[{:item_number=>1, :dish=>"Green Curry", :price=>9}]}

  describe '#basket' do

    it 'is empty to begin with' do
      expect(subject.basket).to be_empty
    end

  end

  describe '#add' do

    it 'adds items to the basket' do
      subject.add(1,1)
      subject.add(1,2)
      basket = {1 => 3}
      expect(subject.basket).to eq basket
    end

  end





end
