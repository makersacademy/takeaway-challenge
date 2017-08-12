require './lib/menu.rb'

describe Menu do
  let(:formatter) { double(:formatter, format_line: "") }
  subject { Menu.new(formatter) }

  describe '.dishes' do
    context 'method call' do
      specify {
        expect(subject).to respond_to(:dishes)
      }
    end
  end

  describe '.show_dishes' do
    context 'method call' do
      specify {
        expect(subject).to respond_to(:show_dishes)
      }
    end

    context 'uses formatter' do
      specify {
        expect(formatter).to receive(:format_line)
        subject.show_dishes
      }
    end

    context 'uses puts' do
      specify {
        expect { subject.show_dishes }.to output.to_stdout
      }
    end
  end

  describe '.get_dish' do
    context 'method call' do
      specify {
        expect(subject).to respond_to(:get_dish)
      }
    end

    context 'gets by index' do
      specify { expect(subject.get_dish(0)).to eq({ name: "spam", price: 2.5 }) }
      specify { expect(subject.get_dish(1)).to eq({ name: 'eggs and spam', price: 4.5 }) }
      specify { expect(subject.get_dish(2)).to eq({ name: 'ham and spam', price: 4.5 }) }
      specify { expect(subject.get_dish(3)).to eq({ name: 'spam and spam', price: 4 }) }
      specify { expect(subject.get_dish(4)).to eq({ name: 'extra spam', price: 1 }) }
    end
  end
end
