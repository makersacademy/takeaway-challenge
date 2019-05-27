require 'takeaway.rb'

describe Takeaway do
  let(:takeaway) { Takeaway.new }
  let(:menu) {Menu.new}

  it 'can create an instance of self' do
    expect(takeaway).to be_instance_of(Takeaway)
  end

  it 'can show the menu' do
    expect(menu).to respond_to(:see_menu)
    takeaway.show_menu
  end
end
