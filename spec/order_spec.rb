require 'order'

describe Order do
  let (:dish) {double :dish}
  let (:dish_2) {double :dish_2}
  let (:menu_instance) {double :menu_instance}
  subject {described_class.new(menu_instance)}

  it{is_expected.to respond_to(:itemised_basket)}
  it{is_expected.to respond_to(:select)}
  it{is_expected.to respond_to(:basket)}
  it{is_expected.to respond_to(:qty_tracker)}

  it 'should display the current order with multiple dishes' do
    allow(menu_instance).to receive(:pick).with(dish).and_return(dish)
    allow(menu_instance).to receive(:pick).with(dish_2).and_return(dish_2)
    subject.select(dish, 2)
    subject.select(dish_2, 2)
    expect(subject.itemised_basket).to eq([dish, dish, dish_2, dish_2])
  end

  describe '#initialize' do
    it 'should initialize with and empty basket' do
      expect(subject.itemised_basket).to eq([])
    end
  end

  describe '#select' do
    it 'should be able to select an item from the menu' do
      allow(menu_instance).to receive(:pick).with(dish).and_return(dish)
      expect(subject.select(dish)).to eq(dish)
    end
  end

  describe '#basket' do
    it 'should display a cumulative order summary' do
      allow(menu_instance).to receive(:pick).with(dish).and_return(dish)
      allow(dish).to receive(:merge).with(dish).and_return(dish)
      subject.select(dish, 3)
      expect{subject.basket}.to output("#{dish}\n").to_stdout
    end
  end

  describe '#summary' do
    # let(:menu) {double :menu}
    it 'should raise an error if the basket is empty' do
      allow(menu_instance).to receive(:pick).and_return({:dish_1 => 4})
      expect{subject.summary}.to raise_error{"There are no items in your basket"}
    end
    # it 'should print the order to the screen' do
    #
    # end
  end

  # describe '#qty_tracker' do
  #   # let (:basket) {double :basket}
  #   it 'should keep track of the quantities of each dish ordered' do
  #     # allow(basket).to receive(:push).with(dish).and_return(dish)
  #     # allow(basket).to receive(:each).with(dish).and_return(dish)
  #     # subject.select(dish, 3)
  #     allow(menu_instance).to receive(:pick).with(dish).and_return(dish)
  #     allow(menu_instance).to receive(:pick).with(dish_2).and_return(dish_2)
  #     subject.basket
  #     expect(subject.qty_tracker).to_return(dish, 3)
  #   end
  # end


end
