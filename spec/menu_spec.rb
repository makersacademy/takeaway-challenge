require "menu"

describe Menu do

  it "user can view the menu and prices" do
    m = Menu.new
    expect(m.view).to eq([{ "doner kebab" => 3.20 },
      { "chicken shish kebab" => 3.00 },
      { "chips" => 1.00 },
      { "cheese and tomato pizza" => 2.80 },
      { "peperoni pizza" => 3.00 },
      { "garlic bread" => 1.20 },
      { "fish and chips" => 3.20 },
      { "chicken chow mein" => 2.80 },
      { "battered mars bar" => 0.80 },
      { "meat pie" => 2.20 },
      { "saveloy" => 0.80 }
      ])
  end

end
