
require 'customer'

describe Customer do

  it{ is_expected.to respond_to :check}

  #why does the test below work?

  it 'can view menu list' do 
    menu = double :menu, items: {"pizza" => 10.5}
    expect(subject.check menu).to eq menu.items
  end

  it 'when selecting dishes, can choose a dish and qty' do
    menu = double :menu
    expect(subject).to respond_to(:select_dishes).with(2).arguments
  end


# NOTE SURE HOW TO TEST FOR WHETHER THE ITEMS PASSED THROUGH ARE LAST ITEM ON ARRAY
  # it 'can choose more than one meal' do 
  #  allow(subject).to receive(:select_dishes) {[dish,num]}
  #  expect(subject.ordered.last).to eq [dish,num]
  # end







end