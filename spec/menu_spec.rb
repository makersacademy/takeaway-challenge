require 'menu.rb'

describe Menu do

  it "initializes the menu with the correct items" do
    expect(subject.menu).to eq({ "spring roll" => 0.99, "char sui bun" => 3.99,
                                "pork dumpling" => 2.99, "peking duck" => 7.99,
                                "fu-king fried rice" => 5.99 })
  end

end
