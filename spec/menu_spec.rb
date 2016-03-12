require 'menu'

describe Menu do

  subject(:menu){described_class.new}
  let(:curry){double :curry, name: "Curry", price: 10}

  it {is_expected.to respond_to(:dishes)}
  it {is_expected.to respond_to(:add).with(1).argument}

  describe '#initialize' do
    it {expect(menu.dishes).to eq []}
  end

  describe '#add' do
    it 'adds dish to dishes' do
      menu.add(curry)
      expect(menu.dishes).to include(curry)
    end
  end


end
