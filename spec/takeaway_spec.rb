#!/usr/bin/env ruby

require 'takeaway'

describe TakeAway do

  let(:menu) { double(:menu, format: 'string') }
  let(:menu_class) { double(:menu_class, from_csv: menu) }
  let(:handler) { double(:handler, response: 'r') }
  let(:dialogue) do 
    double(:dialogue, confirmed: 'y', cancel: 'n', no_order: 'x', 'in_progress': 'p')
  end

  let(:takeaway) do 
    described_class.new(menu_class: menu_class, handler: handler, dialogue: dialogue)
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

  describe '#incoming_order' do
    context 'when order in progress' do
      before(:each) { subject.orders.push('123') }
      
      it 'returns progress message' do
        expect(subject.incoming_order('123', 'order')).to eq 'p'
      end
    end

    context 'when order is permitted' do
      before(:each) { takeaway.incoming_order('123', 'order') }

      it 'puts number in order list' do
        expect(takeaway.orders).to include '123'
      end
    end

    context 'when getting response' do
      subject { takeaway.incoming_order('123', 'y') }

      it 'returns response' do
        expect(subject).to eq 'r'
      end
    end
  end

  describe '#incoming_confirmation' do
    context 'when no order in progress' do
      it 'returns progress message' do
        expect(subject.incoming_confirmation('123', 'order')).to eq 'x'
      end
    end

    context 'when order is permitted' do
      before(:each) { subject.orders.push('123') }
      before(:each) { takeaway.incoming_confirmation('123', 'y') }

      it 'removes number in order list' do
        expect(takeaway.orders).to_not include '123'
      end
    end

    context 'when getting confirmation response' do
      before(:each) { takeaway.orders.push('123') }
      before(:each) { allow(takeaway).to receive(:delivery).and_return('time') }
      subject { takeaway.incoming_confirmation('123', 'y') }

      it 'returns response' do
        expect(subject).to eq 'y'
      end
    end

    context 'when getting confirmation response' do
      before(:each) { takeaway.orders.push('123') }
      subject { takeaway.incoming_confirmation('123', 'n') }

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
