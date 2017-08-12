require './lib/menu.rb'

MENU_OUTPUT =
          "| 0 | spam                 £2.50 |\n" +
          "| 1 | eggs and spam        £4.50 |\n" +
          "| 2 | ham and spam         £4.50 |\n" +
          "| 3 | spam and spam        £4.00 |\n" +
          "| 4 | extra spam           £1.00 |\n"

describe Menu do
  describe '.dishes' do
    context 'responds to dishes' do
      specify {
        expect(subject).to respond_to(:dishes)
      }
    end
  end

  describe '.show_dishes' do
    context 'lists dishes' do
      specify {
        expect { subject.show_dishes }.to output(MENU_OUTPUT).to_stdout
      }
    end
  end

  describe '.get_dish' do
    context 'gets dish by index' do
      specify { expect(subject.get_dish(0)).to eq(['spam', 2.5]) }
      specify { expect(subject.get_dish(1)).to eq(['eggs and spam', 4.5]) }
      specify { expect(subject.get_dish(2)).to eq(['ham and spam', 4.5]) }
      specify { expect(subject.get_dish(3)).to eq(['spam and spam', 4]) }
      specify { expect(subject.get_dish(4)).to eq(['extra spam', 1]) }
    end
  end
end
