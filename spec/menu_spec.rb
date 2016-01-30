require 'menu'

describe Menu do

  it {is_expected.to respond_to(:dishes)}

  describe 'initialize' do

    subject(:menu){described_class.new}

    it 'initializes with a hash of dishes' do
      expect(menu.dishes).to be_a Hash
    end
  end

end
