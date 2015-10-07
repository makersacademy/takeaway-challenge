require 'menu'

describe Menu do
  it "diplays menu items" do
    expect(subject.show).to eq([{dish: 'BBQ',       price: 10},
                                {dish: 'Hamburger', price: 8},
                                {dish: 'Pizza',     price: 9},
                                {dish: 'Pasta',     price: 7},
                                {dish: 'Sushi',     price: 6}])
  end
end
