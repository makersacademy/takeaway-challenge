require 'menu'

describe Menu do

  describe '#view_menu' do

    it 'returns an array' do
      expect(subject.menu).to be_an_instance_of Array
    end

  end

end
