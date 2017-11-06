require 'numbers'

describe Numbers do
  let(:transaction) { double(:transaction, :[] => true, :[]= => true) }
  let(:pstore) { double(:pstore, transaction: transaction) }
  let(:pstore_class) { double(:pstore_class, new: pstore) }
  let(:path) { described_class::DEFAULT_PATH }
  let(:numbers) { described_class.new(storage_class: pstore_class) }
  subject { numbers }

  describe '#initialize' do
    context 'when created' do
      it 'has pstore' do
        expect(subject.pstore). to eq pstore
      end
    end

    context 'when creating pstore' do
      subject { pstore_class }
      after(:each) { described_class.new(storage_class: pstore_class) }

      it 'uses default path' do
        expect(subject).to receive(:new).with(path)
      end
    end
  end

  describe '#has?' do
    context 'when it has a number' do
      before(:each) { allow(pstore).to receive(:transaction).and_return(true) }

      it 'returns true' do
        expect(subject.has?('123')).to be true
      end
    end

    context 'when it doesn\'t a number' do
      before(:each) { allow(pstore).to receive(:transaction).and_return(false) }

      it 'returns true' do
        expect(subject.has?('123')).to be false
      end
    end
  end

  describe '#set' do
    context 'when setting numbers' do
      after(:each) { subject.set('123') }

      it 'passes transaction' do
        expect(pstore).to receive(:transaction)
      end

      it 'passes item to pstore with true' do
        # work out how to do this test!
        # expect(numbers).to receive(:setitem).with('123', true)
        expect(subject.set('123')).to eq true
      end
    end
  end

  describe '#clear' do
    context 'when clearing numbers' do
      before(:each) { allow(numbers).to receive(:setitem).and_return(nil) }
      after(:each) { subject.clear('123') }

      it 'passes transaction' do
        expect(pstore).to receive(:transaction)
      end

      it 'passes item to pstore with true' do
        # work out how to do this test!
        # expect(numbers).to receive(:setitem).with('123', nil)
        expect(subject.clear('123')).to eq nil
      end
    end
  end
end
