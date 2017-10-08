require 'dish_list_parser'
describe DishListParser do
  let(:parser) { DishListParser.new }
  it "creates an empty array uppon initialization" do
    expect(parser.list).to eq []
  end
end
