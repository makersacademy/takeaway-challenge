#!/usr/bin/env ruby

require 'takeaway'

describe TakeAway do

  let(:menu) { double(:menu, format: 'string') }
  let(:menu_class) { double(:menu_class, from_csv: menu) }
  let(:order_class) { double(:order_class, from_selection: order) }
  let(:parser) { double(:parser) }

  let(:takeaway) { described_class.new(menu_class: menu_class) }
  subject { takeaway }

  describe '#initialize' do
    context 'when created' do
      it 'has menu' do
        expect(subject.menu).to eq menu
      end
    end
  end

  describe '#get_menu' do
    context 'when creating menu' do
      after(:each) { subject.get_menu }

      it 'calls menu format method' do
        expect(menu).to receive(:format)
      end
    end

    context 'when returning menu' do
      it 'returns output of menu\'s format method' do
        expect(subject.get_menu).to eq 'string'
      end
    end
  end

  describe '
end
