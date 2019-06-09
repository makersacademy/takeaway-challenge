require 'menu'

RSpec.describe Menu do
  let(:dishes) { double :dishes }
  let(:dishes) do {
      spring_rolls: 5,
      wonton: 10,
      congee: 10,
      chow_mein: 15,
      hotpot: 20
    }
  end
  
  context 'initialize' do
    it 'has a list of dishes and prices' do
      expect(subject.dishes).to eq(dishes)
    end
  end

  describe '#list' do
    it 'prints formatted menu' do
      formatted_menu = 'Spring Rolls: £5, Wonton: £10, Congee: £10, Chow Mein: £15, Hotpot: £20'
      expect(subject.list_menu).to eq(formatted_menu)
    end
  end
end
