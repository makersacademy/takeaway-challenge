require 'order'
require 'menu'

describe Order do
    it 'can add single item to basket' do
        subject.add('Vodka', 1)
        expect(subject.basket).to include(['Vodka', 1, 3.5])
    end
    it 'can add multiple item to basket' do
        subject.add('Vodka', 3)
        expect(subject.basket).to include(['Vodka', 3, 10.5])
    end
    it 'rejects invalid dishes' do
        expect { subject.add 'Cheese', 1 }.to raise_error ('Sorry this dish is not available')
    end
    it 'works out the correct price' do
        subject.add('Vodka', 3)
        subject.add('Wine', 1)
        subject.add('Burger', 2)
        expect(subject.total).to eq 52.5
    end

end
