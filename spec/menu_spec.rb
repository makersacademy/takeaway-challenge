require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#options' do
    it 'shows menu options when called' do
      expect(menu.options).to eq({"beef-chuck brisket sub"=>4.5, "pastrami salami sub"=>5.0})
    end
  end

  describe '#add_item' do
    it 'allows restaurant owner to add items to menu' do
      menu.add_item('chicken duck', 5.50)
      expect(menu.options).to eq({"beef-chuck brisket sub"=>4.5, "pastrami salami sub"=>5.0, "chicken duck"=>5.5})
    end
  end
end
