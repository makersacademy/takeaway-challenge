require 'takeaway.rb'
require 'checkout.rb'

describe Takeaway do
  let(:takeaway) { Takeaway.new }
  let(:menu) {Menu.new}
  let(:checkout) {Checkout.new}

  it 'can create an instance of self' do
    expect(takeaway).to be_instance_of(Takeaway)
  end

  it 'can show the menu' do
    expect(menu).to respond_to(:see_menu)
    puts takeaway.show_menu
  end

end
