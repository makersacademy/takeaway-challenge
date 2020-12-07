require 'takeaway'
require 'dishes'

describe Takeaway do
    
  it 'is expected to be an instance of Takeaway' do
    expect(subject).to be_instance_of Takeaway
  end

  it 'responds to a method print_menu' do
    expect(subject).to respond_to(:print_menu)
  end

  it 'prints menu when print_menu is run' do
    expect(subject.print_menu).to eq Dishes::menu
  end

  it 'has a method select dish with a quantity' do
    expect(subject).to respond_to(:select_dish).with(2).argument
  end
end
