require_relative "../lib/customer.rb"


describe Takeaway do 
  before(:each) do
    take_away = Takeaway.new
  end
  describe 'list_menu' do
  it 'returns the contents of the menu; item and price' do
    expect(subject.list_menu).to eq({"burger"=>5.0, "chips"=>2.0, "coke"=>1.0})
    end
  end
  it 'adds a dish to the menu' do
    subject.add_dish("Pizza", 10)
    expect(subject.list_menu).to eq ({"burger" => 5.0,"chips" => 2.0,"coke" => 1.0,"Pizza" => 10})
  end
  it 'removes an item from the menu' do
     subject.remove_dish("burger")
     expect(subject.menu.has_key?("burger")).to eq false
  end
  it 'tries to remove a dish which doesnt exist' do
    expect(subject.remove_dish("pepsi")).to eq("this dish does not exist")
  end

end
describe Customer do
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
    it 'reads the menu (returns menu item)' do
      expect(subject.readmenu).to eq({"burger" => 5.0, "chips" => 2.0, "coke" => 1.0})
    end
  end
  describe 'SMS' do
    it 'returns order message' do
      sms_double = double :sms , send: "order placed. Basket: []. Cost: 0"
      take_away_double = double :take_away , list_menu: "burger"
      customer = Customer.new(take_away_double , sms_double)
      expect(customer.place_order).to eq("order placed. Basket: []. Cost: 0")
    end
  end
end