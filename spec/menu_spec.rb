require 'menu'

describe Menu do

  describe '#print_menu' do
    it 'should print list of dishes and prices' do
      expect(subject.print_menu).to eq "Choose your pizzas!"
    end
  end

  describe '#print_header' do
    it 'should print header' do
      expect(subject.print_header).to eq puts "Pizza Menu"
    end
  end

end
