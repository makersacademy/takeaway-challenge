require 'formatter'

describe Formatter do

  subject { Formatter.new }

  describe '.format_table' do
    context 'displays' do
      specify {
        item = { name: 'item', price: 1 }
        expected_string =
          "**************************************************\n" +
          "THING\n" +
          "**************************************************\n" +
          "| id | dish                 price\n" +
          "| 0  | item                 £1.00\n" +
          "| 1  | item                 £1.00\n"
        expect(subject.format_table("thing", [item, item])).to eq(expected_string)
      }
    end

    context 'uses head' do
      specify {
        expect(subject).to receive(:head)
        subject.format_table("thing", [])
      }
    end

    context 'uses titles' do
      specify {
        expect(subject).to receive(:titles)
        subject.format_table("thing", [])
      }
    end
  end

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
  #
  # describe '.head' do
  #   describe 'displays properly' do
  #     specify {
  #       expected_string =
  #         "**************************************************\n" +
  #         "THING\n" +
  #         "**************************************************"
  #       expect(subject.head('thing')).to eq(expected_string)
  #     }
  #   end
  # end
  #
  # describe '.titles' do
  #   describe 'displays properly' do
  #     specify {
  #       expected_string = "| id | dish                 price"
  #       expect(subject.titles).to eq(expected_string)
  #     }
  #   end
  # end
  #
  # describe '.line' do
  #   context 'method call' do
  #     specify {
  #       expect(subject).to respond_to(:line)
  #     }
  #   end
  #
  #   context 'line' do
  #     specify {
  #       expected_string = '| 1  | spam                 £2.50'
  #       expect(subject.line(1, 'spam', 2.5)).to eq(expected_string)
  #     }
  #   end
  # end
  #
  # describe '.space' do
  #   context 'method call' do
  #     specify {
  #       expect(subject).to respond_to(:space)
  #     }
  #   end
  #
  #   context 'single word' do
  #     specify {
  #       string = 'hello'
  #       expect(subject.space(string, 10)).to eq(string + (' ' * 5))
  #     }
  #   end
  #
  #   context 'single word' do
  #     specify {
  #       string = 'hello, how are you?'
  #       expect(subject.space(string, 30)).to eq(string + (' ' * 11))
  #     }
  #   end
  #
  #   context 'no words' do
  #     specify {
  #       expect(subject.space('', 20)).to eq('' + (' ' * 20))
  #     }
  #   end
  # end
  #
  # describe '.star_row' do
  #   describe 'made of *' do
  #     specify {
  #       expect(subject.star_row.count("*")).to eq(DISPLAY_WIDTH)
  #     }
  #   end
  #   describe 'lenght is DISPLAY_WIDTH' do
  #     specify {
  #       expect(subject.star_row.length).to eq(DISPLAY_WIDTH)
  #     }
  #   end
  # end
end
