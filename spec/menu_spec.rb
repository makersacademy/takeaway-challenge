require 'menu'

describe DishesMenu do
  let(:dishlist) { [{:dish=>:v, :price=>4},
                    {:dish=>:v, :price=>3}] }
  subject(:menu) { described_class.new(dishlist) }

  it "loads a list of dishes on initialization" do
    expect(menu.list_of_dishes).to eq dishlist
  end
  describe "#format_list" do
    it "formats list of dishes to a menu format" do
      list = "                 LIST OF AVAILABLE DISHES:                  \n\n1. v                                                      £4\n2. v                                                      £3\n\n"
      expect(menu.format_list).to eq list
    end
  end
end
