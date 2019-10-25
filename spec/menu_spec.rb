require 'menu'

describe Menu do
  it 'creates an instance of Menu' do
    expect(subject).to be_an_instance_of Menu
  end

  it 'creates an array with menu items and their prices' do
    expect(subject.menu_items).not_to be_empty
  end
  it 'creates an empty basket array' do
    expect(subject.basket).to be_empty
  end

  it 'prints out the menu items' do
    expect{subject.view_menu}.to output("Kung po chicken £6.80
Chicken chow mein £6.50
Egg fried rice £4.50
").to_stdout
  end

  describe '#select' do
    it 'it allows a customer to store an item in basket' do
      subject.select(0)
      expect{subject.basket}.to eq ({"Kung po chicken" => 6.80})
    end
  end
end