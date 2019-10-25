
require 'menu'

describe Menu do
  context 'Initialization' do
    subject { Menu.new }

    it 'Checks an instance of menu can be created' do
      expect(subject).to be_instance_of Menu
    end

    it 'Has a list of items' do
      expect(subject.items).not_to be_empty
    end

    it 'Basket should be empty when initialized' do
      expect(subject.basket).to be_empty
    end
  end 
  context 'Can see the menu' do
    subject { Menu.new }

    it 'Can view the menu' do
      expect(subject.view_menu).to eq "---Menu---
Burger - £2.00
Hot Dog - £1.50"
    end
  end
  context 'Can select items' do
    subject { Menu.new }
    
    it 'Allows customer to add items to basket' do
      subject.order("Burger", 1)
      expect(subject.basket).not_to be_empty
    end

    it 'Allows user to add multiple items to basket' do
      subject.order("Burger", 2)
      expect(subject.basket.length).to eq 2
    end
  end
end