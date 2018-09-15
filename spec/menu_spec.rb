require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'contains a list of menu @items that are instances of MenuItem' do
    m = described_class.new()
    expect(menu.items[0]).to be_an_instance_of(MenuItem)
    expect(menu.items[-1]).to be_an_instance_of(MenuItem)
  end

  describe '#show_menu' do
    dummy_menu = <<-END
    Pizza: 8
    Burger: 9
    Chips: 4.5
    END
    it 'lists the items inside the basket' do
      expect { menu.show_menu }.to output { dummy_menu }.to_stdout
    end
  end

  describe '#find_item' do
   
  end

end
