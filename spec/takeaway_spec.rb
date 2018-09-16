require './lib/takeaway'

describe Takeaway do
  let(:menu2) {menu2 = {
    "fish and chips" => '£3.20', 
    "burger and chips" => '£4.20', 
    "chips" => '£1'}
  }

let(:dish1) {dish1 = {"fish and chips" => '£3.20'}}
let(:dish2) {dish2 = {"burger and chips" => '£4.20'}}
let(:dish3) {dish3 = {"chips" => '£1'}}

let(:selection1) {selection1 = "fish and chips"}
let(:selection2) {selection2 = "burger and chips"}
let(:selection3) {selection3 = "chips"}

  it 'to responds to calling menu' do
    expect(subject).to respond_to(:menu)
  end
  it 'to be able to see the menu' do
    expect(subject.menu).to eq(menu2)
  end
  it 'to responds to calling add_meal' do  
    expect(subject).to respond_to(:add_meal)
  end
  it 'to add meal to order, that customer selects' do
    expect{subject.add_meal(selection2)}.to change{subject.order}.from({}).to(dish2) 
  end
  it 'able to add multiple meals to the order' do
    subject.add_meal(selection2)
    subject.add_meal(selection3)
    expect(subject.order).to eq({"burger and chips" => '£4.20', "chips" => '£1'})
  end
end

