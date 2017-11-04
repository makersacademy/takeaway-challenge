#!/usr/bin/env ruby

require 'orderparser'

describe OrderParser do
  let(:order_class) { double(:order_class, from_selection: :order) }
  let(:string) { '100 101x2 102 x3 103 x 4' }
  let(:parsed) { { 100 => 1, 101 => 2, 102 => 3, 103 => 4 } }
  let(:parser) { described_class.new }

  subject { parser } 

  describe '#to_hash' do
    context 'when parsing well-formed orders' do
      subject { parser.to_hash(string) }

      it 'generates hash mapping numbers to quantities' do
        expect(subject).to eq parsed
      end
    end

    context 'when parsing orders with duplicate keys' do
      it 'raises error with no quantities' do
        expect { subject.to_hash('100 100') }.to raise_error DuplicateError
      end

      it 'raises error with quantities' do
        expect { subject.to_hash('100x1 100x5') }.to raise_error DuplicateError
      end
    end

    context 'when parsing badly-formed orders' do
      it 'raises error for consecutive quantities' do
        expect { subject.to_hash('1 2') }.to raise_error ParseError
      end 

      it 'raises error for consecutive "x" symbols' do
        expect { subject.to_hash('101x1 102xx2') }.to raise_error ParseError
      end 

      it 'raises error for quantities over 99' do
        expect { subject.to_hash('101x1 102x100') }.to raise_error ParseError
      end 

      it 'raises error for unaccompanied quantities' do
        expect { subject.to_hash('101 102 3') }.to raise_error ParseError
      end 

      it 'raises error for consecutive "x" symbols' do
        expect { subject.to_hash('101x1 102xx2') }.to raise_error ParseError
      end 
    end
  end
end
