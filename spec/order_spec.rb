require 'order'

describe Order do
  describe '@order_list' do
    it 'starts as an empty list' do
      expect(subject.order_list).to be_empty()
    end
  end
  describe '#add_item' do
    it 'adds a item and price hash to order_list' do
      subject.add_item({ 'Mixed Starter' => 7 })
      expect(subject.order_list).to include({ 'Mixed Starter' => 7 })
    end
  end
  describe '#add_by_name' do
    it 'adds an item price hash to order_list by item name' do
      subject.add_by_name('Mixed Starter')
      expect(subject.order_list).to include({ 'Mixed Starter' => 7 })
    end
  end
  describe '#interactive_menu' do
    it 'takes inputs from user and if matches item name adds to order_list' do
      allow(subject).to receive(:gets).and_return("Yuk Sung\n", "stop\n")
      subject.interactive_menu
      expect(subject.order_list).to include( { 'Yuk Sung' => 6.4 })
    end
  end
end