require './lib/order'
describe Order do
  let(:dish_class) { double :dish_class, new: dish }
  let(:dish) { double :dish, name: :durain, price: 440 }
  let(:dish_inst) { double :dish, name: :tomacco, price: 2500 }
  let(:dish_inst_test) { double :dish, name: :tomacco, price: 2500 }
  let(:subject)    { described_class.new(:dish_class) }
  context 'Feature 1 - list of dishes' do
    before(:each) { 2.times { |_| subject.add_dish(dish) } }
    describe '#dish_list' do
      it { expect(subject).to respond_to(:dish_list) }
    end
    describe '#add_dish' do
      it { expect(subject).to respond_to(:add_dish) }
      it 'can add a dish correctly' do
        subject.add_dish(dish)
        expect(subject.dish_list.last).to eq(dish)
      end
    end
    describe '#remove_dish' do
      it { expect(subject).to respond_to(:remove_dish) }
      it 'can remove a list correctly' do
        subject.add_dish(dish_inst)
        subject.remove_dish(dish_inst)
        expect(subject.dish_list.length).to eq(2) # should be removed 
      end
      it 'should still remove different instances with same name' do
        subject.add_dish(dish_inst)
        subject.remove_dish(dish_inst_test)
        expect(subject.dish_list.length).to eq(2)
      end
    end
  end
  context 'Feature 2 - total cost' do
    before(:each) { 2.times { |_| subject.add_dish(dish) } }
    describe '#total_cost' do
      it { expect(subject).to respond_to(:total_cost) }
      it { expect(subject.total_cost).to eq(880) }
    end
  end
  context 'Feature 3 - place order' do
    before(:each) { 2.times { |_| subject.add_dish(dish) } }
    describe '#place_order' do
      it { expect(subject).to respond_to(:place_order) }
    end
  end
end
