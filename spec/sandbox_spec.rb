require 'sandbox'

describe SomethingThatCallsFoo do
  let(:foo_caller) { SomethingThatCallsFoo.new }

  describe '#some_long_process' do
    let(:foobar_result) { double('foobar_result') }
    let(:baz) { double('baz') }

    context 'using allow/expect' do
      before do
        allow(Foo).to receive(:bar).with(baz).and_return(foobar_result)
      end

      it 'calls qux method on result of Foo.bar(baz)' do
        expect(foobar_result).to receive(:qux)
        foo_caller.some_long_process(baz)
      end
    end

    context 'using expect/and_return' do
      it 'calls qux method on result of Foo.bar(baz)' do
        expect(Foo).to receive(:bar).with(baz).and_return(foobar_result)
        expect(foobar_result).to receive(:qux)
        foo_caller.some_long_process(baz)
      end
    end
  end
end
