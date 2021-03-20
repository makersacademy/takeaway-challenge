require 'menu'

describe Menu do
  let(:test) { Menu.new }

  describe 'add_to_menu' do
    it 'creates and stores a dish' do
      test.add_to_menu("Pasta", "4")
      expect(test.dishes[0]).to be_kind_of(Dish)
    end
  end
end
