require 'menu'

describe Menu do
    
    let(:dishes_file)   { "./spec/dishes.txt" }
    let(:dishes)        { {lamb_rogan_josh: 925, chicken_madras: 895} }
    let(:print_dishes)  { "Lamb Rogan Josh £9.25, Chicken Madras £8.95." }
    
    subject(:menu)      { described_class.new(dishes_file) }
    
    it 'reads dishes_file to create a dishes hash' do
        expect(menu.dishes).to eq(dishes)
    end
    
    it 'can print a list of dishes' do
        expect(menu.print_dishes).to eq(print_dishes)
    end
end