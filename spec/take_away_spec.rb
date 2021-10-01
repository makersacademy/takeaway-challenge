require_relative "../lib/take_away.rb"

describe Takeaway do 
  before(:each) do
    take_away = Takeaway.new
  end
  describe 'list_menu' do
  it 'returns the contents of the menu; item and price' do
    expect(subject.list_menu).to eq({"burger"=>5.0, "chips"=>2.0, "coke"=>1.0})
  end
end
  describe 'basket & adding/removing items' do 
    it 'adds an item to the basket' do
      subject.add_item("burger")
      expect(subject.basket).to eq ["burger"]
    end
    it 'handles invalid order requests (items not on menu)' do
      expect(subject.add_item("pepsi")).to eq("This is not a menu item")
    end
    it 'tries to remove an item that is not in the basket' do
      expect(subject.remove_item("coke")).to eq "this item is not in your basket"
    end
    it 'adds then removes an item; makes sure basket empty' do
      subject.add_item("chips")
      subject.remove_item("chips")
      expect(subject.basket).to eq []
    end 
    it  'adds then removes an item; makes sure total is correct' do
      subject.add_item("chips")
      subject.remove_item("chips")
      expect(subject.total).to eq 0
    end

  end
end