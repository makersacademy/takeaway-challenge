require "menu"

describe Menu do 
  subject(:menu) { described_class.new(dishes) } 

  let(:dishes) do 
    {
      Margherita: 8.99
    }
  end

    it 'has a list of dishes and prices.' do 
        expect(menu.dishes).to eq(dishes)
    end
end

