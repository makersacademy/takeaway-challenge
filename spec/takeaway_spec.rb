require 'takeaway'

describe Takeaway do

  it { is_expected.to respond_to(:order).with(2).argument }

  it 'show_menu should display all items and prices' do
    subject.add_dish('chilli', 2.99)
    subject.add_dish('lasagne', 4.5)
    expect(subject.show_menu).to eq "[{\"chilli\"=>2.99}, {\"lasagne\"=>4.5}]"
  end

  it 'order should display confirmation message' do
    expect{ subject.order("chilli", 3) }.to output("3x chilli(s) added to your basket.\n").to_stdout
  end

  it 'order should add to basket' do
    subject.order("chilli", 3)
    expect(subject.basket).to include("chilli"=>3)
  end
end
