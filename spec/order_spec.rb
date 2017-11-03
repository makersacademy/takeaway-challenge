#!/usr/bin/env ruby

require 'order'

describe Order do

  let(:menuitem) { double(:menuitem, title: 'dish', value: 2) }
  let(:money_class) { double(:money_class, new: 0) }

  let(:kwargs) { { currency: 'GBP', money_class: money_class } }
  let(:order) { described_class.new(**kwargs) }
  subject { order }

  describe '#initialize' do
    context 'when created' do
      it 'has items hash' do
        expect(subject.items).to be_a Hash
      end

      it 'has no items' do
        expect(subject.items).to be_empty
      end
      
      it 'has currency' do
        expect(subject.currency).to eq 'GBP'
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
      before(:each) { subject.items.update({ 5 => 6, 3 => 4 }) }

      it 'sums values multiplied by quantity' do
        expect(subject.total).to eq 42
      end
    end
  end
end
