require 'list_printer'

describe ListPrinter do
  subject(:aclass) { Class.new.extend(ListPrinter) }
  let(:dish) { double("Dish", name: 'shwarma', cost: 9) }
  let(:dish2) { double("Dish", name: 'pizza', cost: 5) }
  let(:dish3) { double("Dish", name: 'burger', cost: 7) }

  context 'given a list of dishes' do
    it 'prints a list of dishes' do
      list = [dish, dish2, dish3, dish2, dish]
      message = [
        '1. shwarma, £9',
        '2. pizza, £5',
        '3. burger, £7',
        '4. pizza, £5',
        '5. shwarma, £9'
      ]
      message.each do |x|
        expect(STDOUT).to receive(:puts).with(x)
      end
      expect(aclass.print_list(list))
    end
  end
end
