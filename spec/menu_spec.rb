require 'menu'

describe Menu do
    let(:menu) {["Pizza, £5", "Pasta, £8", "Bruschetta, £3", "Burrata, £4.5", "Lasagne, £10", "Gelato, £2.5", "Tiramisu, £4.99"]}
    
    it 'returns a list of dishes' do
        expect(subject.show_menu).to eq menu
    end

    it 'returns true if the menu has the dish' do
        expect(subject.has_dish?("Pizza")).to eq true
    end

    it 'returns false if the menu does not have the dish' do 
        expect(subject.has_dish?("Chicken")).to eq false
    end
end
