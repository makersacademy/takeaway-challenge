require 'menu'

describe Menu do
  let(:fake_menu) { double 'fake_menu' }
  let(:fake_printer_class) { double 'fake_printer_class' }
  let(:fake_order_class) { double 'fake_order_class' }
  let(:fake_item) { double 'fake_item' }
  subject(:subject) { described_class.new(fake_printer_class, fake_order_class)}

  it 'Should initialize with menu array' do
    expect(subject.menu).to eq [
      { item: "Devil's Cauliflower", price: 4 },
      { item: "Rainbow Pot", price: 3 },
      { item: "Oreo Brownie", price: 3 },
    ]
  end

  describe '#display_menu' do

    it 'Should call print method with me' do
        expect(fake_printer_class).to receive(:formatter).with(subject.menu)
        subject.display_menu
      # end
    end
  end

  describe '#select_item' do
    it 'Should  call order_item method with item' do
      expect(fake_order_class).to receive(:order_item).with(fake_item)
      subject.select_item(fake_item)
    end
  end

  describe '#deselect_item' do
    it 'Should  call remove_item method with item' do
      expect(fake_order_class).to receive(:remove_item).with(fake_item)
      subject.deselect_item(fake_item)
    end
  end
end
