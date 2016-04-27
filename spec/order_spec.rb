require 'order'

describe Order do
  let(:dish) {double :dish}
  let(:dish_2) {double :dish_2}
  let(:menu_instance) {double :menu_instance}
  subject {described_class.new(menu_instance)}

  it{is_expected.to respond_to(:select)}
  it{is_expected.to respond_to(:basket)}

  it 'should display the current order with multiple dishes' do
    allow(menu_instance).to receive(:pick).with(dish).and_return(dish => 7)
    allow(menu_instance).to receive(:pick).with(dish_2).and_return(dish_2 => 5)
    subject.select(dish, 2)
    subject.select(dish_2, 2)
    expect(subject.basket).to eq(dish => 14, dish_2 => 10)
  end

  describe '#initialize' do
    it 'should initialize with and empty basket' do
      expect(subject.basket).to eq([])
    end
  end

  describe '#select' do
    it 'should be able to select an item from the menu' do
      allow(menu_instance).to receive(:pick).with(dish).and_return(dish)
      expect{subject.select(dish)}.to output(String).to_stdout
    end
  end

  describe '#basket' do
    it 'should display a cumulative order summary' do
      allow(menu_instance).to receive(:pick).with(dish).and_return(dish)
      allow(dish).to receive(:merge).with(dish).and_return(dish)
      subject.select(dish, 3)
      expect(subject.basket).to eq(dish)
    end
  end

  describe '#summary' do
    it 'should raise an error if the basket is empty' do
      allow(menu_instance).to receive(:pick).and_return(:dish_1 => 4)
      expect{subject.summary}.to raise_error{"Your basket is empty"}
    end
  end

end
