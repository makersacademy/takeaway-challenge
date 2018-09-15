require 'menu'
describe Menu do
  let(:russian) { described_class.new }

  it "displays the menu" do
    expect(russian.current_menu).to eq({
      "pelmeni" => 6.99,
      "borscht" => 5.99,
      "tvarog" => 3.99,
      "olivier" => 4.99,
      "salat" => 1.99,
      "blinchiki" => 9.99
    })
  end

  it "adds a dish" do
    russian.add_dish("smetyana", 0.99)
    expect(russian.current_menu).to include("smetyana" => 0.99)
  end
end