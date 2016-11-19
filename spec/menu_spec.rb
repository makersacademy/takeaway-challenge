require 'menu'

describe Menu do
  let(:dishlist) { DishList::DISHES }
  subject(:menu) { described_class.new(dishlist) }

  it "loads a list of dishes on initialization" do
    expect(menu.list_of_dishes).to eq dishlist
  end

  it "formats list of dishes" do
    expect(menu.format_list).to be_a(String)
  end

  it "displays a list of dishes and prices" do
    expect { menu.show_dishes }.to output(menu.format_list).to_stdout
  end

end
