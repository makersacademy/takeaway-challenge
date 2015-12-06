require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#options' do
    it 'shows menu options when called' do
      expect(menu.options).to eq({'katsu wrap' => 4.50, 'tikki masala' => 5.00})
    end
  end

  describe '#add_item' do
    it 'allows restaurant owner to add items to menu' do
      menu.add_item('chicken duck', 5.50)
      expect(menu.options).to eq({'chicken duck' => 5.50, 'katsu wrap' => 4.50, 'tikki masala' => 5.00})
    end
  end
end
