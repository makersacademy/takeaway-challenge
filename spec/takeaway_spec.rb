#!/usr/bin/env ruby

require 'takeaway'

describe TakeAway do

  let(:menu) { double(:menu, format: 'string') }
  let(:menu_class) { double(:menu_class, from_csv: menu) }
  let(:handler) { double(:handler, response: 'r') }
  let(:handler_class) { double(:handler_class, new: handler) }
  let(:numbers) { double(:numbers, has?: true, set: nil, clear: nil) }
  let(:dialogue) do 
    double(:dialogue, confirmed: 'y', cancel: 'n', 
           no_order: 'x', 'in_progress': 'p')
  end

  let(:takeaway) do 
    described_class.new(menu_class: menu_class, handler: handler_class, 
                        dialogue: dialogue, numbers: numbers)
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

  describe '#response' do
    context 'when getting confirmation' do
      after(:each) { takeaway.response('123', 'y') }
      
      it 'calls confirmation' do
        expect(takeaway).to receive(:confirmation).with('123', 'y')
      end
    end

    context 'when getting order' do
      after(:each) { takeaway.response('123', 'order') }

      it 'calls confirmation' do
        expect(takeaway).to receive(:order).with('123', 'order')
      end
    end
  end

  describe '#order' do
    context 'when order in progress' do
      it 'returns progress message' do
        expect(subject.order('123', 'order')).to eq 'p'
      end
    end

    context 'when order is permitted' do
      before(:each) { allow(numbers).to receive(:has?).and_return(false) }
      after(:each) { takeaway.order('123', 'order') }

      it 'puts number in order list' do
        expect(numbers).to receive(:set).with('123')
      end
    end

    context 'when getting response' do
      before(:each) { allow(numbers).to receive(:has?).and_return(false) }
      subject { takeaway.order('123', 'order') }

      it 'returns response' do
        expect(subject).to eq 'r'
      end
    end
  end

  describe '#confirmation' do
    context 'when no order in progress' do
      before(:each) { allow(numbers).to receive(:has?).and_return(false) }

      it 'returns progress message' do
        expect(subject.confirmation('123', 'order')).to eq 'x'
      end
    end

    context 'when order is permitted' do
      after(:each) { takeaway.confirmation('123', 'y') }

      it 'removes number in order list' do
        expect(numbers).to receive(:clear).with('123')
      end
    end

    context 'when getting confirmation response' do
      before(:each) { allow(takeaway).to receive(:delivery).and_return('time') }
      subject { takeaway.confirmation('123', 'y') }

      it 'returns response' do
        expect(subject).to eq 'y'
      end
    end

    context 'when getting confirmation response' do
      subject { takeaway.confirmation('123', 'n') }

      it 'returns response' do
        expect(subject).to eq 'n'
      end
    end
  end

  describe '#delivery' do
    context 'gets current time' do
      let(:time) { double(:time, now: now) }
      let(:now) { double(:time, :+ => delayed) }
      let(:delayed) { double(:time, strftime: :time) }
      subject { takeaway.delivery(time_class: time) }

      it 'gets formatted time' do
        expect(subject).to eq :time
      end
    end
  end
end
