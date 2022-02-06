require_relative '../lib/takeaway'

describe Takeaway do

    describe '#menu returns itself' do
      it 'prints menu when called' do
        expect(subject.display_menu).to eq 'Fish' => 1, 
                                    'Burger' => 2, 
                                    'Chips' => 3, 
                                    'Pizza' => 8, 
                                    'Pasta' => 0.5
      end
    end

    describe '#order' do

      it 'allows me to order a quantity of dishes' do
        subject.order('Fish', 4 )
        expect(subject.basket.length).to eq 4
      end

      it 'quantity paramenter is set to 1 by default' do
        subject.order('Fish')
        expect(subject.basket).to eq (['Fish'])
      end

      it 'gives message if selected item is not avalible' do
        expect(subject.order('Pie', 3)).to eq 'Sorry, this is unavailable'
      end

      it 'give a message confirming order has been added to basket' do
        expect(subject.order('Fish', 4)).to eq "Great! 4 portions of Fish have been added to your order"
      end

    end

    describe '#review_order' do
      
      it 'displays basket quanities and totals in a formatted way' do
        subject.order('Fish')
        expect(subject.review_order).to eq('In your basket you have 1 Fish totalling £1. Your order comes to £1.')
      end

      it 'displays basket when there are multiple items and totals' do
        subject.order('Fish', 3)
        subject.order('Pizza', 1)
        subject.order('Fish', 2)
        expect(subject.review_order).to eq('In your basket you have 5 Fish totalling £5. In your basket you have 1 Pizza totalling £8. Your order comes to £13.')
      end

    end

end


