require 'menu'

describe Menu do
  let(:fish_item) { double(:menuitem, title: 'fish', price: 5) }
  let(:chips_item) { double(:menuitem, title: 'chips', price: 3) }
  let(:formatter) { double(:formatter, format: 'a line') }
  let(:menuitem_class) { double(:menuitem_class, new: fish_item) }
  let(:csv_class) { double(:csv, foreach: [['fish', 5], ['chips', 3]]) }
  let(:menu) { described_class.new([fish_item, chips_item]) }
  subject { menu }

  describe '#initialize' do
    context 'when created with array' do
      it 'has list of items' do
        expect(subject.items).to be_a Array
      end

      it 'contains passed items' do
        expect(subject.items).to eq [fish_item, chips_item]
      end
    end
  end

  describe 'class #from_csv' do
    subject { described_class.from_csv('path', menuitem_class, csv_class) }

    context 'when creating instance from csv' do
      it 'creates 2 items' do
        expect(subject.items.length).to eq 2
      end

      it 'is populated with menuitems' do
        expect(subject.items.first).to eq fish_item
      end
    end
  end

  describe '#get' do
    context 'when accessing items by index (starting from 100)' do
      it 'can get 0th item' do
        expect(subject.get(100)).to eq fish_item
      end

      it 'can get 1st item' do
        expect(subject.get(101)).to eq chips_item
      end
    end
  end

  describe '#format' do
    context 'when applying format' do
      after(:each) { subject.format(formatter, :arg) }

      it 'formats first item with other arguments' do
        expect(formatter).to receive(:format).with(100, fish_item, :arg)
      end

      it 'formats second item with other arguments' do
        expect(formatter).to receive(:format).with(101, chips_item, :arg)
      end
    end

    context 'when creating string' do
      subject { menu.format(formatter) }

      it 'creates 2 lines' do
        expect(subject.split("\n").length).to eq 2
      end
    end
  end

  describe '#get_missing' do
    context 'when given numbers that are present' do
      subject { menu.get_missing(100 => 2, 101 => 3) }

      it 'returns empty list' do
        expect(subject).to eq []
      end
    end

    context 'when given numbers that are absent' do
      subject { menu.get_missing(200 => 2, 201 => 3) }

      it 'returns list of numbers' do
        expect(subject).to eq [200, 201]
      end
    end
  end
end
