require 'print'

describe Print do
  let(:menu) { [pizza, chips] }
  let(:pizza) { double(:dish, price: 10, name: "Pizza") }
  let(:chips) { double(:dish, price: 2, name: "Chips") }

  describe '#print_menu' do

    it 'should print of a menu in a readable format' do
      expect(subject.print_menu(menu)).to eq "1. Pizza £10\n2. Chips £2"
    end

  end
end
