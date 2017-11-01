#!/usr/bin/env ruby

require 'menuitem'

describe MenuItem do

  let(:menuitem) { described_class.new('mushy peas', 5) }
  subject { menuitem }

  describe '#initialize' do
    context 'when created' do
      it 'has title' do
        expect(subject.title).to eq 'mushy peas'
      end

      it 'has price' do
        expect(subject.price).to eq 5
      end
    end
  end

  describe '#tagline' do
    context 'with line of normal length' do
      subject { menuitem.tagline(30) }

      it 'starts with title' do
        expect(subject).to start_with 'mushy peas'
      end

      it 'ends with pretty price' do
        expect(subject).to end_with '£5.00'
      end

      it 'is 30 characters long' do
        expect(subject.length).to eq 30
      end

      it 'is one line long' do
        expect(subject).to_not include "\n"
      end
    end

    context 'with line of excessive length' do
      subject { described_class.new('a' * 50, 5) }

      it 'raises error' do
        expect { subject.tagline(30) }.to raise_error RuntimeError
      end
    end
  end
end
