require './lib/menu'
describe Menu do
  let(:dish_class) { double :dish_class, new: dish }
  let(:dish) { double :dish, name: :Durain, price: 440 }
  let(:menu) { described_class.new(dish_class) }
  context 'Feature 1 - list of dishes' do
    describe '#dish_list' do
      it { expect(menu).to respond_to(:dish_list)}
      it { expect(menu.dish_list).to be_a(Array) }
      it { expect(menu).to respond_to(:create_menu) }
      it { expect(menu.dish_list[0]).to eq(dish_class) }
    end
    describe '#create_menu' do
      it { expect(menu).to respond_to(:create_menu) }
      it { expect(menu.create_menu).to eq(25) } # loop is right length
    end
  end
end
