require 'Take_Away'

describe Take_Away do

  let(:menu) { Menu.new }
  let(:ordered_item) { double :ordered_item }

  it 'initializes with a menu' do
    subject = Take_Away.new(menu)
    expect(subject.menu).to eq menu
  end

  it 'responds to read menu method' do
    expect(subject).to respond_to(:read_menu)
  end

  it "has an order method that puts customer's selection in basket" do
    expect {subject.order(ordered_item)}.to output("#{ordered_item} added to your basket.\n").to_stdout
  end

end
