require 'menu'

describe Menu do
  
  let(:pizza) { MenuItem.new("american hot", 9) }

  context 'new menu contains empty list' do

    it 'menu has empty list(hash)' do
      expect(subject.list).to eq Hash.new
    end
  end

  context 'adds menu item to list' do

    it 'should accept a new item with 2 arguments' do
      expect(subject).to respond_to(:add_new_item).with(2).arguments
    end

    it 'adds menu item to list' do
      subject.add_new_item("pepperoni", 9)
      expect(subject.list).to include "pepperoni"
    end 

    it 'new items in hash with key to equal name' do
      subject.add_new_item("pepperoni", 9)
      expect(subject.list).to have_key("pepperoni")
    end

    it 'new item in list has price attribute equal to price' do
      subject.add_new_item("pepperoni", 9)
      item = subject.list["pepperoni"]
      expect(item.price).to eq 9
    end
  end

  context 'prints menu' do

    it 'prints the name attribute in the value of the hash' do
      subject.add_new_item("pepperoni", 9)
      expect(subject.print_menu).to eq ["pepperoni - £9"]
    end
  end
end
