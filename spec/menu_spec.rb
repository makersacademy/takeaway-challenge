require 'menu'

describe Menu do
  subject(:menu) { described_class.new(price_list) }
  let(:price_list) { double :price_list }

  it 'should initialize with a list of dishes and prices' do
    expect(menu.price_list).to eq price_list
  end

  describe '#print_list' do
    it 'should respond to the print list method' do
      expect(menu).to respond_to(:print_list)
    end

    it 'should print the list of dishes and prices' do
      expect(menu.print_list).to eq price_list
    end
  end

end
