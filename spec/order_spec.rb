require './lib/order'

describe Order do

  let(:takeaway) { double(:takeaway) }
  let(:menu) { double(:menu) }

  context 'Initialization' do

      it 'creates an empty basket on creation' do
        expect(subject.basket).to eq []
      end

  end

  context 'View Basket' do

    it 'can let a customer review their basket' do
      allow(takeaway).to receive(:select_item).and_return(Hash)
      expect(subject.view_basket).to eq subject.basket
    end

  end







end
