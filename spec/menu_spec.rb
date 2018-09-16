require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'contains a list of menu @items that are instances of MenuItem' do
    expect(menu.items[0]).to be_an_instance_of(MenuItem)
    expect(menu.items[-1]).to be_an_instance_of(MenuItem)
  end

  describe '#show_menu' do
    # heredoc -> to define multiline strings
    dummy_menu = <<-HEREDOC
    Pizza: 8
    Burger: 9
    Chips: 4.5
    HEREDOC
    it 'lists the items inside the basket' do
      expect { menu.show_menu }.to output { dummy_menu }.to_stdout
    end
  end

  describe '#find_item' do
    it 'raises an error when the ordered item is not on the menu' do
      expect { menu.find_item('Dummy') }.to raise_error('This dish is not on the menu!') 
    end
    it 'returns the item when found on the menu' do
      menu_item = menu.find_item('Burger')
      expect(menu_item).to be_an_instance_of(MenuItem)
      expect(menu_item.name).to eq('Burger')
      expect(menu_item.price).to eq(9)
    end
  end

end
