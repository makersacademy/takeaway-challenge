require 'takeaway'

describe Takeaway do
  let(:dishes){ {Chicken: 5} }

  it 'has an empty order' do
    expect(subject.order).to be_empty
  end

    it 'respond to menu' do
      expect(subject).to respond_to(:menu)
    end

     it 'stores a list of dishes' do
        expect(subject.menu).to eq dishes
      end


end
