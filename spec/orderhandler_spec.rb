require 'orderhandler'

describe OrderHandler do
  let(:menu) { double(:menu) }
  let(:order) { double(:order) }
  let(:order_class) { double(:order_class, from_selection: order) }
  let(:parser) { double(:parser, to_hash: { a: 1 }) }
  let(:dialogue) { double(:dialogue) }
  let(:handler) do
    described_class.new(menu, dialogue: dialogue, parser: parser)
  end

  subject { handler }

  describe '#initialize' do
    context 'when created' do
    end
  end

  describe '#build_order' do
    context 'when receiving SMS message' do
      after(:each) { subject.build_order('sms', factory: order_class) }

      it 'parses order into hash' do
        expect(parser).to receive(:to_hash).with('sms')
      end

      it 'creates Order object' do
        expect(order_class).to receive(:from_selection).with(menu, { a: 1 })
      end

      it 'returns Order object' do
        expect(subject.build_order('sms', factory: order_class)).to eq order
      end
    end
  end

  shared_examples 'error message' do |symbol|
    context 'when creating message' do
      before(:each) do
        allow(dialogue).to receive(symbol).with('1, 2').and_return('msg')
      end

      it 'gets message from dialogue' do
        expect(subject.send(symbol, 's')).to eq 'msg'
      end
    end
  end

  describe '#malformed' do
    include_examples('error message', :malformed)

    before(:each) do 
      allow(parser).to receive(:get_errors).with('s').and_return([1, 2])
    end
  end

  describe '#duplicated' do
    include_examples('error message', :duplicated)

    before(:each) do 
      allow(parser).to receive(:get_duplicates).with('s').and_return([1, 2])
    end
  end

  describe '#missing' do
    include_examples('error message', :missing)

    before(:each) do 
      allow(menu).to receive(:get_missing).with('s').and_return([1, 2])
    end
  end

  describe '#finalise' do
    context 'when creating message' do
      before(:each) do
        allow(dialogue).to receive(:finalise).with(order).and_return('msg')
      end

      it 'returns confirmation message' do
        expect(subject.finalise(order)).to eq 'msg'
      end
    end
  end

  describe '#response' do
    after(:each) { subject.response('order') }

    context 'when receiving valid order' do
      before(:each) do
        allow(subject).to receive(:build_order).and_return(order)
      end

      it 'calls place with object' do
        expect(subject).to receive(:finalise).with(order)
      end
    end

    context 'when order has syntax errors' do
      before(:each) do
        allow(subject).to receive(:build_order).and_raise ParseError
        allow(parser).to receive(:get_errors).and_return([1, 2])
      end

      it 'creates message' do
        expect(dialogue).to receive(:malformed).with('1, 2')
      end
    end

    context 'when order has duplicates' do
      before(:each) do
        allow(subject).to receive(:build_order).and_raise DuplicateError
        allow(parser).to receive(:get_duplicates).and_return([1, 2])
      end

      it 'creates message' do
        expect(dialogue).to receive(:duplicated).with('1, 2')
      end
    end

    context 'when order has invalid items' do
      before(:each) do
        allow(subject).to receive(:build_order).and_return(order)
        allow(subject).to receive(:finalise).and_raise RangeError
        allow(menu).to receive(:get_missing).and_return([1, 2])
      end

      it 'creates message' do
        expect(dialogue).to receive(:missing).with('1, 2')
      end
    end
  end
end
