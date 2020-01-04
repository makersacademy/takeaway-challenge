require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }

  it 'select a number of dishes to order' do
    expect(subject).to respond_to(:add_to_cart).with(2).arguments
  end

  describe '#process' do
    it 'allows user to select from the interactive menu' do
      expect(subject.process(3)).to eq(subject.view_cart)
    end
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

  it 'puts 5 items when called' do        
    STDOUT.should_receive(:puts).exactly(5).times
    subject.print_options
  end
  
end
