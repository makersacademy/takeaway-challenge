require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }

  let(:menu) { double :menu, list_dishes: dishes }
  let(:dishes) { "Sushi £4.00, Shashimi £5.00"}

  it "prints a list of dishes" do
    expect(subject.print_dishes).to eq dishes
  end


end
