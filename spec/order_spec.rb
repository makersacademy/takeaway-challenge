require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double :menu }
  let(:dishes) { {"Pizza" => 10} }
  let(:dish) { double :dish }
  let(:quantity) { double :quantity }

  describe '#add' do
    it 'should add selection to basket' do
      order.add(dish)
      expect(order.items).to include dish
    end
  end


  describe '#total_price' do
    xit 'order total to be sum of items added' do
      cost = dishes["Pizza"] * 2
      order.add("Pizza", 2)
      expect(order.total_price).to eq cost
    end
  end
  # describe '#amount_due?' do
  #   before do
  #     allow(menu).to receive(:dishes).and_return ({:Chicken => 12.50, :Pizza => 10, :Pasta=> 8.99, :Steak=> 25.99})
  #   end
  #
  #   it 'should return the total_price' do
  #     expect(order.amount_due?).to eq order.total_price
  #   end
  # end


end
