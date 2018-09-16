require './lib/takeaway'

describe Takeaway do
  let(:menu2) { menu2 = {
    "fish and chips" => 3.20, 
    "burger and chips" => 4.20, 
    "chips" => 1 }
  }

  let(:dish1_quantity1) { dish1_quantity1 = { "fish and chips x1" => 3.20 } }
  let(:dish2_quantity2) { dish2_quantity2 = { "burger and chips x2" => 8.40 } }
  let(:dish3_quantity3) { dish3_quantity3 = { "chips x3" => 3 } }

  let(:selection1) { selection1 = "fish and chips" }
  let(:selection2) { selection2 = "burger and chips" }
  let(:selection3) { selection3 = "chips" }

  it 'to responds to calling menu' do
    expect(subject).to respond_to(:menu)
  end
  it 'to responds to calling add_meal' do  
    expect(subject).to respond_to(:add_meal)
  end
  it 'responds to calling total' do
    expect(subject).to respond_to(:order)
  end
  it 'to be able to see the menu' do
    expect(subject.menu).to eq(menu2)
  end
  it 'will only add meals that are on the menu' do
    expect{subject.add_meal("no meal here sorry", 1)}.to raise_error("Sorry that is not on the menu")
  end
  it 'to add meal to order, that customer selects' do
    expect{subject.add_meal(selection2, 2)}.to change{subject.order}.from({}).to(dish2_quantity2) 
  end
  it 'able to add multiple meals to the order' do
    subject.add_meal(selection2, 2)
    subject.add_meal(selection3, 3)
    expect(subject.order).to eq({"burger and chips x2" => 8.40, "chips x3" => 3})
  end
  it 'expects initial value of order to be 0' do
    expect(subject.total).to eq(0)
  end
  it 'total of order is the sum of prices of all the dishes' do
    subject.add_meal(selection2, 1)
    subject.add_meal(selection3, 1)    
    expect(subject.total).to eq("£5.20")
  end

  describe 'once order has been finalised and order can be placed' do 
    it 'responds to calling place_order' do
    expect(subject).to respond_to(:place_order)
    end
  end
end

