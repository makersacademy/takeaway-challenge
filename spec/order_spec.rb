require 'order'

describe Order do
  let (:menu_item) {double :menu_item}
  let (:menu_item_2) {double :menu_item_2}
  let (:menu_instance) {double :menu_instance}
  subject {described_class.new(menu_instance)}

  it{is_expected.to respond_to(:itemised_basket)}
  it{is_expected.to respond_to(:select)}
  it{is_expected.to respond_to(:basket)}
  it{is_expected.to respond_to(:qty_tracker)}

  it 'should display the current order with multiple dishes' do
    allow(menu_instance).to receive(:pick).with(menu_item).and_return(menu_item)
    allow(menu_instance).to receive(:pick).with(menu_item_2).and_return(menu_item_2)
    subject.select(menu_item, 2)
    subject.select(menu_item_2, 3)
    expect(subject.itemised_basket).to eq([menu_item, menu_item, menu_item_2, menu_item_2, menu_item_2])
  end

  describe '#initialize' do
    it 'should initialize with and empty basket' do
      expect(subject.itemised_basket).to eq([])
    end
  end

  describe '#select' do
    it 'should be able to select an item from the menu' do
      allow(menu_instance).to receive(:pick).with(menu_item).and_return(menu_item)
      expect(subject.select(menu_item)).to eq(menu_item)
    end
  end

  describe '#basket' do
    it 'should display a cumulative order summary' do
      allow(menu_instance).to receive(:pick).with(menu_item).and_return(menu_item)
      allow(menu_item).to receive(:merge).with(menu_item).and_return(menu_item)
      subject.select(menu_item, 3)
      expect{subject.basket}.to output("#{menu_item}\n").to_stdout
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
  #     # allow(basket).to receive(:push).with(menu_item).and_return(menu_item)
  #     # allow(basket).to receive(:each).with(menu_item).and_return(menu_item)
  #     # subject.select(menu_item, 3)
  #     allow(menu_instance).to receive(:pick).with(menu_item).and_return(menu_item)
  #     allow(menu_instance).to receive(:pick).with(menu_item_2).and_return(menu_item_2)
  #     subject.basket
  #     expect(subject.qty_tracker).to_return(menu_item, 3)
  #   end
  # end


end
