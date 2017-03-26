require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  #subject(:order) { described_class.new(menu) }
  let(:dish) { double :dish }
  let(:quantity) { double :quantity }
  let(:total_price) { double :total_price }
  let(:menu) { double :menu }

  # describe '#initialization' do
  #   it 'should create an empty selection array' do
  #     expect(order.basket).to eq []
  #   end
  # end


  describe '#order' do
    it { is_expected.to respond_to(:add).with(2).arguments }

    it 'should check if dish available' do
      allow(menu).to receive(:contain_item?) { false }
      message = "#{dish} not available in menu"
      expect{order.add(dish, quantity)}.to raise_error message
    end

  end
  #
  #
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
