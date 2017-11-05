#!/usr/bin/env ruby

require 'takeaway'

describe TakeAway do

  let(:menu) { double(:menu, format: 'string') }
  let(:menu_class) { double(:menu_class, from_csv: menu) }
  let(:order) { double(:order) }
  let(:order_class) { double(:order_class, from_selection: order) }
  let(:parser) { double(:parser, to_hash: { a: 1 }) }
  let(:dialogue) do 
    double(:dialogue, confirmed: 'y', cancelled: 'n', 
           no_order: 'x', confirm?: '?'
          )
  end

  let(:takeaway) do 
    described_class.new(menu_class: menu_class, parser: parser, 
                        dialogue: dialogue
                       )
  end

  subject { takeaway }

  describe '#initialize' do
    context 'when created' do
      it 'has menu' do
        expect(subject.menu).to eq menu
      end

      it 'has empty orders array' do
        expect(subject.orders).to eq []
      end
    end
  end

  describe '#print_menu' do
    context 'when creating menu' do
      after(:each) { subject.print_menu }

      it 'calls menu format method' do
        expect(menu).to receive(:format)
      end
    end

    context 'when returning menu' do
      it 'returns output of menu\'s format method' do
        expect(subject.print_menu).to eq 'string'
      end
    end
  end

  describe '#build_order' do
    context 'when receiving SMS message' do
      after(:each) { subject.build_order('sms', order_class: order_class) }

      it 'parses order into hash' do
        expect(parser).to receive(:to_hash).with('sms')
      end

      it 'creates Order object' do
        expect(order_class).to receive(:from_selection).with(menu, { a: 1 })
      end

      it 'returns Order object' do
        expect(subject.build_order('sms', order_class: order_class))
          .to eq order
      end
    end
  end

  describe '#incoming_order' do
    after(:each) { subject.incoming_order('123', 'order') }

    context 'when receiving valid order' do
      before(:each) do
        allow(subject).to receive(:build_order).and_return(order)
      end

      it 'calls place with object' do
        expect(subject).to receive(:place).with('123', order)
      end
    end

    context 'when order has syntax errors' do
      before(:each) do
        allow(subject).to receive(:build_order).and_raise ParseError
      end

      it 'creates message' do
        expect(dialogue).to receive(:malformed).with('order')
      end
    end

    context 'when order has duplicates' do
      before(:each) do
        allow(subject).to receive(:build_order).and_raise DuplicateError
      end

      it 'creates message' do
        expect(dialogue).to receive(:duplicated).with('order')
      end
    end

    context 'when order has invalid items' do
      before(:each) do
        allow(subject).to receive(:build_order).and_return(order)
      end

      before(:each) do
        allow(subject).to receive(:place).and_raise RangeError
      end

      it 'creates message' do
        expect(dialogue).to receive(:missing).with(order)
      end
    end
  end

  describe '#place' do
    context 'when placing order' do
      after(:each) { subject.place('123', order) }

      it 'registers number' do
        expect(subject.orders).to receive(:push).with('123')
      end

      it 'gets dialogue message' do
        expect(dialogue).to receive(:confirm?).with(order)
      end
    end

    context 'after placing menu' do
      subject { takeaway.place('123', order) }

      it 'returns dialogue message' do
        expect(subject).to eq '?'
      end
    end
  end

  describe '#confirm' do
    before(:each) { subject.orders.push('123') }

    context 'when no order exists' do
      it 'returns message' do
        expect(subject.confirm('234', 'msg')).to eq 'x'
      end
    end

    context 'when receiving confirmation or cancellation' do
      it 'marks order as complete' do
        expect { subject.confirm('123', 'y') }
          .to change { subject.orders.length }.by(-1)
      end
    end

    context 'when receiving confirmation' do
      before(:each) { allow(subject).to receive(:delivery).and_return('1') }
      after(:each) { subject.confirm('123', 'y') }

      it 'returns confirmation' do
        expect(subject.confirm('123', 'y')).to eq 'y'
      end

      it 'calls with delivery time' do
        expect(dialogue).to receive(:confirmed).with('1')
      end
    end

    context 'when receiving cancellation' do
      it 'returns confirmation' do
        expect(subject.confirm('123', 'n')).to eq 'n'
      end
    end
  end
end
