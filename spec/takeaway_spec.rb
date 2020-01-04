require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }

  it 'select a number of dishes to order' do
    expect(subject).to respond_to(:add_to_cart).with(2).arguments
  end

  before do
    subject.add_to_cart("Vegemite Toast", 2)
  end
    
  it 'shows list of dishes and prices on menu' do
    expect(subject.see_menu).not_to be_empty
  end 

  it 'allows user to add dishes to cart' do
    expect(subject.your_order).to eq ["2 x Vegemite Toast"]
  end
  
  it 'views cart with total cost and ordered food' do
    expect(subject.total_cost).to eq 8
  end

  it 'prints an interactive menu' do
    expect(subject).to respond_to(:interactive_menu)
  end

  it 'prints an options' do
    expect(subject).to respond_to(:print_options)
  end

  it 'prints a menu' do
    expect(subject).to respond_to(:process).with(1).arguments
  end

  it 'prints a header' do
    expect do
      subject.print_header
      end.to output("Welcome to the Koala Cafe! All prices are in £.").to_stdout
  end

  it 'returns correct total cost' do
    expect(subject.correct_total?).to be true
  end

  # it 'prints order' do
  #   expect do
  #     subject.view_cart
  #   end.to output("2 x Vegemite Toast. ").to_stdout
  # end
end
