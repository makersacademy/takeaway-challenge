require 'menuitem'

describe MenuItem do
  let(:price) { '£5.50' }
  let(:money) { double(:money, format: price, to_f: 5.5) }
  let(:money_class) { double(:money_class, new: money) }
  let(:kwargs) { { money_class: money_class } }
  let(:menuitem) { described_class.new('mushy peas', 550, **kwargs) }
  subject { menuitem }

  describe '#initialize' do
    context 'when created' do
      it 'has title' do
        expect(subject.title).to eq 'mushy peas'
      end

      it 'has price object' do
        expect(subject.price_object).to eq money
      end
    end

    context 'when creating price object' do
      before(:each) { kwargs[:currency] = 'USD' }
      after(:each) { described_class.new('dish', 100, **kwargs) }

      it 'creates price object with correct arguments' do
        expect(money_class).to receive(:new).with(100, 'USD')
      end
    end

    context 'when created with default currency' do
      after(:each) { described_class.new('dish', 100, **kwargs) }

      it 'is denominated in GBP' do
        expect(money_class).to receive(:new).with(100, 'GBP')
      end
    end
  end

  describe '#price' do
    context 'when creating price' do
      after(:each) { subject.price }

      it 'converts price object to string' do
        expect(subject.price_object).to receive(:format)
      end
    end

    context 'after creating formatted price' do
      it 'returns formatted price' do
        expect(subject.price).to eq price
      end
    end
  end

  describe '#value' do
    context 'when creating price' do
      after(:each) { subject.value }

      it 'converts price object to float' do
        expect(subject.price_object).to receive(:to_f)
      end
    end

    context 'after creating formatted price' do
      it 'returns 5.5' do
        expect(subject.value).to eq 5.5
      end
    end
  end
end
