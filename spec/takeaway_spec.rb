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
    
    end

    # describe '#avlaible?' do
    
    #  it 'returns true when the selected item is avalibale' do
    #     expect
        

end


