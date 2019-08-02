require 'menu'

describe Menu do

describe "#food" do

subject(:menu) { described_class.new(food)}
let(:food){ {yum1: 1, yum2: 2} }

  it "has a list of names and prices" do
    expect(menu.food).to eq food
  end
end


describe "#item" do

  subject(:menu) { described_class.new(food)}
  let(:food){ {yum1: 1, yum2: 2} }
  let(:item1){ :yum1 }
  let(:item2){ :yum2 }

  it "lets the user select a dish and adds it to their selection" do
    menu.add(item1)
    menu.add(item2)
    expect(menu.order).to eq "{:yum1=>1}, {:yum2=>2}"
  end
end
# describe "#order" do
#
#   subject(:menu) { described_class.new(food)}
#   let(:food){ {yum1: 1, yum2: 2} }
#   let(:item1){ {yum1: 1} }
#   let(:item2){ {yum2: 2} }
#   it "lets the user select a dish and adds it to their basket" do
#     menu.add(item1)
#     menu.add(item2)
#     expect(menu.order).to eq yum1: 1, yum2: 2
#   end




  end


# require 'menu'
#
# describe Menu do
#   it "prints a list of names and prices" do
#     expect(subject.print).to eq PRINTED_MENU
#   end
# end
