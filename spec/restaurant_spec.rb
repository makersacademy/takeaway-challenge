require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new }

  it 'should add a new item to the menu' do
    restaurant.add_item("pizza",3)
    expect(restaurant.menu).to include("pizza")
  end

  context 'when the user has finished ordering' do
    describe '#finish' do
      before do
        allow(restaurant).to receive(:send_text)
      end
      it 'should text the user' do
        expect(restaurant).to receive(:send_text)
        restaurant.finish("your order is finished")
      end
    end
  end

end
