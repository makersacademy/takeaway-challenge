require './lib/takeaway.rb'

describe Takeaway do
  let(:takeaway) { Takeaway.new }

  it 'Creates an instance of the takeaway menu' do
    expect(takeaway).to be_instance_of(Takeaway)
  end
  it 'Lists the items in the menu with prices' do
    expect(takeaway.menu(@menu_list)).to eq [{ :Chicken => "£4", :Mutton => "£7" }]
  end

end
