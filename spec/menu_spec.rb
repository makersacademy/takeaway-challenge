require './lib/menu'

describe Menu do
  alias_method :menu, :subject
  let(:cuisine) { { 'pho' => 5, 'bun' => 3, 'noodles' => 4 } }

  describe '@cuisine' do
    it 'prints menu' do
      expect(menu.cuisine).to eq cuisine
    end
  end
end
