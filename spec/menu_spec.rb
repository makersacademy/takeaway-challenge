require 'menu'

describe Menu do

  it{is_expected.to respond_to(:menu)}

  describe '#initialize' do

    it 'should create a menu containing food items and prices' do
      expect(subject.menu).to include({:king_burger => 8})
    end

  end





end
