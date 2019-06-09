require 'menu'

RSpec.describe Menu do
  let(:menu) { described_class.new(dishes_on_menu) }
  let(:dishes_on_menu) do {
      spring_rolls: 5,
      wonton: 10,
      congee: 10,
      chow_mein: 15,
      hotpot: 20
    }
  end
  
  context 'initialize' do
    it 'has a list of dishes and prices' do
      expect(menu.dishes).to eq(dishes_on_menu)
    end
  end

  describe '#print_menu' do
    it 'prints formatted menu' do
      printed_menu = 'Spring Rolls: £5, Wonton: £10, Congee: £10, Chow Mein: £15, Hotpot: £20'
      expect(menu.print_menu).to eq(printed_menu)
    end
  end
end
