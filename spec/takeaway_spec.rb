require 'takeaway'
describe Takeaway do
  it 'displays a list of menu items' do
    expect(subject.read_menu).to have_key(:Lasagne)
  end 

  it 'displays their price' do
    expect(subject.read_menu).to have_value(12)
  end 
end 
