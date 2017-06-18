require "menu"

describe Menu do

  let(:menu)  { described_class.new }

  it { is_expected.to respond_to(:welcome) }
  it { is_expected.to respond_to(:print_dishes) }


  it "should display a welcome message" do
    expect(menu.welcome).to include "Today's specials are:"
  end

  it "prints list of dishes with prices" do
    expect(menu.print_dishes).to include "kimchi_jjigae, £8"
  end
end
