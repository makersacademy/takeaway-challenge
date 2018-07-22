require './lib/menu'
describe Menu do
  let(:dish_class) { double :dish_class, new: dish }
  let(:dish) { double :dish, name: :Durain, price: 440 }
  let(:subject) { described_class.new(dish_class) }
  context 'Feature 1 - list of dishes' do
    describe '#dish_list' do
      it { expect(subject).to respond_to(:dish_list) }
      it { expect(subject.dish_list).to be_a(Array) }
      it { expect(subject.dish_list[0]).to eq(dish) }
    end
    describe '#create_menu' do
      it { expect(subject).to respond_to(:create_menu) }
      it { expect(subject.create_menu).to eq(15) } # loop is right length
      it 'can use entered menu' do
        subject.create_menu([dish, dish, dish])
        expect(subject.dish_list).to eq([dish, dish, dish])
      end
    end
  end
end
