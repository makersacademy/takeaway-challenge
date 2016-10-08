require 'menu'

describe Menu do
    
    subject(:menu) { described_class.new(dishes) }
    
    let(:dishes) do {ratkajino: 5, earl_gray: 5} end
    
    it 'has a list of dished with prices' do
        expect(menu.dishes).to eq(dishes)
    end
end
