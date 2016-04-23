require 'order'

describe Order do
  let (:menu_item) {double :menu_item}
  let (:menu_item_2) {double :menu_item_2}
  let (:menu_instance) {double :menu_instance}
  subject {described_class.new(menu_instance)}

  it{is_expected.to respond_to(:basket)}
  it{is_expected.to respond_to(:select)}

  it 'should display the current order with multiple dishes' do
    allow(menu_instance).to receive(:pick).with(menu_item).and_return(menu_item)
    allow(menu_instance).to receive(:pick).with(menu_item_2).and_return(menu_item_2)
    subject.select(menu_item, 2)
    subject.select(menu_item_2, 3)
    expect(subject.basket).to eq([menu_item, menu_item, menu_item_2, menu_item_2, menu_item_2])
  end

  describe '#initialize' do
    it 'should initialize with and empty basket' do
      expect(subject.basket).to eq([])
    end
  end

  describe '#select' do
    it 'should be able to select an item from the menu' do
      allow(menu_instance).to receive(:pick).with(menu_item).and_return(menu_item)
      expect(subject.select(menu_item)).to eq([menu_item])
    end
  end
end
