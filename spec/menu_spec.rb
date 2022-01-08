require "menu"

describe Menu do

  it "can return the value of hash in items" do
    expect(subject.print_menu).to eq({
      :pasta => 6,
      :pizza => 10,
      :ramen => 7,
      :soup => 3 
    })
  end

end
