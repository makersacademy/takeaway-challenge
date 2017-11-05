require 'order'

describe Order do
  let(:menu) { double(:menu) }
  let(:formatter) { double(:formatter, format: 'a line') }
  let(:menuitem) { double(:menuitem, title: 'dish', price_object: 2) }
  let(:otheritem) { double(:menuitem, price_object: 5) }
  let(:money_class) { double(:money_class, new: 0) }
  let(:kwargs) { { currency: 'GBP', money_class: money_class } }
  let(:order) { described_class.new(**kwargs) }
  subject { order }

  describe '#initialize' do
    context 'when created with no arguments' do
      it 'has items hash' do
        expect(subject.items).to be_a Hash
      end

      it 'has no items' do
        expect(subject.items).to be_empty
      end

      it 'has currency' do
        expect(subject.currency).to eq 'GBP'
      end

      it 'implements missing-value behaviour' do
        expect(subject.items[:c]).to eq 0
      end
    end

    context 'when given hash' do
      subject { described_class.new(existing: { b: 2 }).items }

      it 'uses given hash' do
        expect(subject).to eq(b: 2)
      end

      it 'still implements missing-value behaviour' do
        expect(subject[:c]).to eq 0
      end
    end
  end

  describe 'class #from_selection' do
    context 'when creating from menu and item-quantity hash' do
      before(:each) { allow(menu).to receive(:get).with(1).and_return(:a) }
      before(:each) { allow(menu).to receive(:get).with(2).and_return(:b) }
      subject { described_class.from_selection(menu, 1 => 5, 2 => 1) }

      it 'has 5 of item 1' do
        expect(subject.items[:a]).to eq 5
      end

      it 'has 1 of item 2' do
        expect(subject.items[:b]).to eq 1
      end
    end

    context 'when receiving unexpected items' do
      subject { described_class }
      before(:each) { allow(menu).to receive(:get).and_return(nil) }

      it 'raises error' do
        expect { subject.from_selection(menu, a: 1) }
          .to raise_error RangeError
      end
    end
  end

  describe '#add' do
    context 'when adding items without quantity' do
      before(:each) { subject.add(menuitem) }

      it 'adds 1 item' do
        expect(subject.items[menuitem]).to eq 1
      end
    end

    context 'when adding items with quantity 5' do
      before(:each) { subject.add(menuitem, 5) }

      it 'adds 5 items' do
        expect(subject.items[menuitem]).to eq 5
      end
    end
  end

  describe '#value' do
    context 'when initializing total' do
      after(:each) { subject.total }

      it 'makes zero-value money object' do
        expect(money_class).to receive(:new).with(0, 'GBP')
      end
    end

    context 'when adding item values' do
      before(:each) { subject.items.update(menuitem => 4, otheritem => 5) }

      it 'sums values multiplied by quantity' do
        expect(subject.total).to eq 33
      end
    end
  end

  describe '#format' do
    before(:each) { order.items.update(a: 1, b: 2) }

    context 'when applying format' do
      after(:each) { subject.format(formatter) }

      it 'formats first item with other arguments' do
        expect(formatter).to receive(:format).with(:a, 1)
      end

      it 'formats second item with other arguments' do
        expect(formatter).to receive(:format).with(:b, 2)
      end
    end

    context 'when creating string' do
      subject { order.format(formatter) }

      it 'creates 2 lines' do
        expect(subject.split("\n").length).to eq 2
      end
    end
  end

  describe '#time' do
    context 'gets current time' do
      let(:time) { double(:time, now: now) }
      let(:now) { double(:time, :+ => delayed) }
      let(:delayed) { double(:time, strftime: :time) }
      subject { described_class.new(time_class: time) }

      it 'gets formatted time' do
        expect(subject.time).to eq :time
      end
    end
  end
end
