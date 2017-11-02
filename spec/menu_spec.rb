#!/usr/bin/env ruby

require 'menu'

describe Menu do

  # mock menuitems
  let(:fish) { double(:menuitem, title: 'fish', price: 5) }
  let(:chips) { double(:menuitem, title: 'chips', price: 3) }

  # mock menuitem classes
  let(:menuitem) { double(:menuitem) }
  let(:menuitem_class) { double(:menuitem_class, new: menuitem) }

  # mock csv
  let(:csv) { double(:csv, foreach: [[fish, 5], [chips, 3]]) }

  subject { described_class.new([fish, chips]) }

  describe '#new' do
    context 'when created with array' do
      it 'has list of items' do
        expect(subject.items).to be_a Array
      end

      it 'contains passed items' do
        expect(subject.items).to eq [fish, chips]
      end
    end
  end

  describe 'class #from_csv' do
    subject { described_class.from_csv('path', menuitem_class, csv) }

    context 'when creating instance from csv' do
      it 'creates 2 items' do
        expect(subject.items.length).to eq 2 
      end
       
      it 'is populated with menuitems' do
        expect(subject.items.first).to eq menuitem
      end
    end
  end

  describe '#get' do
    context 'when accessing items by index' do
      it 'can get 0th item' do
        expect(subject.get(0)).to eq fish
      end

      it 'can get 1st item' do
        expect(subject.get(1)).to eq chips
      end
    end
  end
end
