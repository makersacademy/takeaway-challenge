require 'takeaway'
describe Takeaway do 
  let(:takeaway) { described_class.new(Menu) }
  it 'expects takeaway.new to create a new takeaway object' do
    expect(takeaway).to be_instance_of(described_class)
  end 
  it 'user can add several dishes to a basket ' do 
    takeaway.add(4, "kebab")
    takeaway.add("curry")
    expect(takeaway.basket).to eq([{ "kebab" => 5.0 }, { "kebab" => 5.0 }, { "kebab" => 5.0 }, { "kebab" => 5.0 }, { "curry" => 7.5 }])
  end 
  it 'throws error message if user makes request off-menu' do 
    expect(takeaway.add('seabass')).to eq("This dish is not on the menu") 
  end 
  it 'calculates the total correct' do
    takeaway.add("curry")
    takeaway.add(4, "salad")
    expect(takeaway.bill).to eq(11.50)  
  end 
  it 'gives customer an ETA of +60min when order is placed' do
    arrival_time = Time.new + (60 * 60)
    expect(takeaway.order).to eq("Order is on it's way! ETA: #{arrival_time.strftime("%H:%M")}")
  end 
end 

# let(:fake_menu) {double :fake_menu, new: menu_class}
#   let (:menu_class) {double :menu_instance} 
#   let(:subject) { described_class.new(fake_menu) }
