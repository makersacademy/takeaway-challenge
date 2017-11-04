#!/usr/bin/env ruby

require 'formats'

describe MenuFormat do

  let(:menuitem) { double(:menuitem, title: 'fish', price: '£5.00') }
  let(:formatter) { described_class.new(length: 50, index_length: 6) }
  subject { formatter }

  describe '#format' do
    context 'when creating formatted string' do
      let(:index) { '   4 |' }
      subject { formatter.format(4, menuitem) }

      it 'starts with formatted index' do
        expect(subject).to start_with index
      end

      it 'follows index with title' do
        expect(subject.gsub(index, '')).to start_with ' fish '
      end

      it 'ends with price' do
        expect(subject).to end_with ' £5.00'
      end

      it 'is 50 characters' do
        expect(subject.length).to eq 50
      end
    end
 
    context 'when using default parameters' do
      subject { described_class.new.format(4, menuitem) }

      it 'is 40 characters' do
        expect(subject.length).to eq 40
      end

      it 'starts with formatted index' do
        expect(subject).to start_with '  4 |'
      end
    end
  end
end

describe ItemisedFormat do

  let(:menuitem) { double(:menuitem, title: 'fish') }
  let(:formatter) { described_class.new(length: 50, count_length: 4) }
  subject { formatter }

  describe '#format' do
    context 'when creating formatted string' do
      let(:count) { 'x4  ' }
      subject { formatter.format(menuitem, 4) }

      it 'starts with title' do
        expect(subject).to start_with 'fish '
      end

      it 'ends with formatted count' do
        expect(subject).to end_with count
      end

      it 'is 50 characters' do
        expect(subject.length).to eq 50
      end
    end
 
    context 'when using default parameters' do
      subject { described_class.new.format(menuitem, 4) }

      it 'is 40 characters' do
        expect(subject.length).to eq 40
      end

      it 'starts with formatted index' do
        expect(subject).to end_with 'x4 '
      end
    end
  end
end
