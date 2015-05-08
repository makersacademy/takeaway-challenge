require_relative '../lib/customer'
require 'menu_spec'

describe Customer do

  let (:menu) { double :menu , display_menu: [["Pounded Yam", 15],["Jollof Rice", 10]]}

  it 'should be able to select a dish from the menu' do
    expect(subject.select_dish menu , 1).to eq(["Pounded Yam" , 15])
  end

  it 'should be able to verify correct order' do
    subject.select_dish menu , 1
    subject.select_dish menu , 2
    expect(subject.order_total). to eq 25
  end

  it 'should be able to send a text verifying order' do
    expect(subject.text).to eq("Text!")
  end

end