require 'takeaway'

describe Takeaway do
  let(:dishes){ {chicken: 5, pizza: 3, ice_cream: 2} }

  it 'has an empty order' do
    expect(subject.order).to be_empty
  end

  it 'respond to menu' do
    expect(subject).to respond_to(:menu)
  end

  it 'stores a list of dishes' do
    expect(subject.menu).to eq dishes
  end

    describe '#select_dishes' do

      it { is_expected.to respond_to(:select_dishes).with(2).arguments }

    end




end
