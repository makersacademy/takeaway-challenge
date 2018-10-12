require 'menu'

describe Menu do
  it "should display the menu" do
    expect(subject.menu).to eq({
                                  "fish" => 10,
                                  "steak" => 20,
                                  "chips" => 4,
                                  "pie" => 12,
                                  "dessert" => 8
                                })
  end
end
