require 'menu'

describe Menu do
  
  
  context 'new menu contains empty list' do

    it 'menu has empty list(array)' do
      expect(subject.list).to eq []
    end
  end

  context 'adds menu item to list' do

    it 'adds menu item to list' do
      subject.add_item("item")
      expect(subject.list[-1]).to eq "item"
    end 
  end
end
