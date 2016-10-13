require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes)}
  let(:dishes) do
    {
      sushi:     4.00,
      shashimi:  5.00,
    }
  end

  describe 'initialize' do
    it 'starts with dishes' do
      expect(menu.dishes).to eq dishes
    end
  end

  describe '#list_dishes' do
    

  end


end
