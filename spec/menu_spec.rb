require 'menu'
require 'dish'

describe Menu do
  LIST = "1 Spaghetti:12\n2 Macaroni:9\n".freeze
  DISHES = [Dish.new("Spaghetti", 12), Dish.new("Macaroni", 9)].freeze
  it "should display dishes" do
    subject = Menu.new(DISHES)
    expect(subject.display_dishes).to eq(LIST)
  end
  it "should prevent display if empty menu" do
    subject = Menu.new([])
    expect { subject.display_dishes }.to raise_error "empty menu"
  end
end
