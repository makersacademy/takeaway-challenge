require 'menu'

describe Menu do
  let(:fake_printer_class) { double 'fake_printer_class' }
  let(:fake_order_class) { double 'fake_order_class' }
  subject(:subject) { described_class.new(fake_printer_class, fake_order_class) }

  it 'Should initialize with menu array' do
    expect(subject.menu).to eq [
      { item: "Devil's Cauliflower", price: 4 },
      { item: "Rainbow Pot", price: 3 },
      { item: "Oreo Brownie", price: 3 },
    ]
  end

  describe '#display_menu' do
    it 'Should call print method' do
        expect(fake_printer_class).to receive(:formatter).with(subject.menu)
        subject.display_menu
    end
  end

  describe '#select_item' do
    it 'Should call order_item method with item' do
      allow(subject.menu).to receive(:select) { ["test"] }
      expect(fake_order_class).to receive(:order_item).with("test")
      subject.select_item("")
    end
  end

  describe '#deselect_item' do
    it 'Should  call remove_item method with item' do
      allow(subject.menu).to receive(:select) { ["test"] }
      expect(fake_order_class).to receive(:remove_item).with("test")
      subject.deselect_item("")
    end
  end

  describe '#place_order' do
    it 'Should print current_order using Printer formatter method' do
      allow(fake_order_class).to receive(:current_order) { ["test"] }
      allow(fake_order_class).to receive(:confirm_order)
      expect(fake_printer_class).to receive(:formatter).with(["test"])
      subject.place_order
    end

    it 'Should call the confirm_order method' do
      allow(fake_order_class).to receive(:current_order) { ["test"] }
      allow(fake_printer_class).to receive(:formatter).with(["test"])
      expect(fake_order_class).to receive(:confirm_order)
      subject.place_order
    end
  end
end
