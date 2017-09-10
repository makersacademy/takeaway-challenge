# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

require 'menu'
require 'takeaway'

describe Menu do
subject(:menu) { described_class.new(dishes)}
  let(:dishes) do
    {
      beef: 3.00,
      chicken: 2.00,
      cod: 5.00
    }
  end

  it "has a list of dishes with prices" do
    expect(subject.dishes).to eq(:dishes)
  end

  it "prints a list of dishes with prices" do
    # printed_menu = "beef 3, chicken 2, cod 5"
    expect(menu.print).to eq(dishes)
  end

end


# describe Menu do
#
#
#   describe "#print_menu" do
#     it "prints a list of dishes and prices" do
#       it { is_expected.to respond_to(:print_menu) }
#     end
#   end
#
#
#
#
# end
