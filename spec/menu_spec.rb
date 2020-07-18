require 'menu'

describe Menu do

  describe '#view_menu' do
    it 'views menu array' do
      expect(subject.view_menu).to eq subject.menu
    end
  end
end
