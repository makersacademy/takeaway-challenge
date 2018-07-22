require 'takeaway'
describe Takeaway do 
  let(:takeaway) { described_class.new(Menu) }
  it 'expects takeaway.new to create a new takeaway object' do
    expect(takeaway).to be_instance_of(described_class)
  end 
end 

# let(:fake_menu) {double :fake_menu, new: menu_class}
#   let (:menu_class) {double :menu_instance} 
#   let(:subject) { described_class.new(fake_menu) }
