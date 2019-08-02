require 'menu'

describe Menu do

subject(:menu) { described_class.new(food)}
let(:food){ {yum1: 1, yum2: 2} }
  it "has a list of names and prices" do
    expect(menu.food).to eq food
  end


end

# require 'menu'
#
# describe Menu do
#   it "prints a list of names and prices" do
#     expect(subject.print).to eq PRINTED_MENU
#   end
# end
