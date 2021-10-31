require 'menu'

describe Menu do
  let(:itemA) { double("itemA", :name => "Egg fried rice", :price => 4.99) }
  let(:itemB) { double("itemB", :name => "Steamed rice", :price => 4.49) }
  let(:itemC) { double("itemC", :name => "Sesame prawn toast", :price => 7.99) }
  let(:new_menu) { Menu.new([itemA, itemB, itemC]) }

  it 'calling import on menu provides a full menu' do
    expect(subject.import).to eq Menu::DEFAULT_MENU
  end

  describe '#review_menu' do
    it 'returns a list of menu items in the correct format' do
      expect(new_menu.review_menu).to eq "1. Egg fried rice, £4.99
2. Steamed rice, £4.49
3. Sesame prawn toast, £7.99"
    end
  end
  
end
