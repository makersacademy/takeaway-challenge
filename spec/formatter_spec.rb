require 'formatter'

describe Formatter do

  subject { Formatter }

  describe '.format_price' do
    context 'method call' do
      specify {
        expect(subject).to respond_to(:format_price)
      }
    end

    context 'decimal' do
      specify {
        expect(subject.format_price(2.5)).to eq("£2.50")
      }
    end

    context 'whole number' do
      specify {
        expect(subject.format_price(2)).to eq("£2.00")
      }
    end

    context 'zero' do
      specify {
        expect(subject.format_price(0)).to eq("£0.00")
      }
    end
  end

  describe '.format_with_space' do
    context 'method call' do
      specify {
        expect(subject).to respond_to(:format_with_space)
      }
    end

    context 'single word' do
      specify {
        string = 'hello'
        expect(subject.format_with_space(string, 10)).to eq(string + (' ' * 5))
      }
    end

    context 'single word' do
      specify {
        string = 'hello, how are you?'
        expect(subject.format_with_space(string, 30)).to eq(string + (' ' * 11))
      }
    end

    context 'no words' do
      specify {
        expect(subject.format_with_space('', 20)).to eq('' + (' ' * 20))
      }
    end
  end

  describe '.format_line' do
    context 'method call' do
      specify {
        expect(subject).to respond_to(:format_line)
      }
    end

    context 'line' do
      specify {
        expected_line = '| 1 | spam                 £2.50 |'
        expect(subject.format_line(1, 'spam', 2.5)).to eq(expected_line)
      }
    end
  end
end
