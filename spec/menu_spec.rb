require 'menu'

describe Menu do

let(:menu) { described_class.new(food) }
let(:food) do
  { :margherita => 6.5 }
end

  describe '#food' do
    it 'should contain a list of the menu food' do
      expect(menu.food).to eq(food)
    end
  end

  describe '#print_list' do
  #   it 'should respond to print_list method' do
  #     expect(subject).to respond_to(:print_list)
  #   end
    it 'should print a list of dishes and prices' do
      printed_menu = "Margherita: £6.50"
      expect(menu.print_list).to eq(printed_menu)
    end
  end
end
