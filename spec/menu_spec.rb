require 'menu'

describe Menu do
  subject(:menu) { described_class.new(price_list) }
  let(:price_list) { double :price_list, show: list }
  let(:availables) { double :availables }
  let(:list) { double :list }

  it 'should initialize with a list of dishes and prices' do
    expect(menu.price_list).to eq price_list
  end

  describe '#display' do
    it 'should respond to the display method' do
      expect(menu).to respond_to(:display)
    end

    it 'should display the list of dishes and prices' do
      expect(menu.display).to eq list
    end
  end

end
