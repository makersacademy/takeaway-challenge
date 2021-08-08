require "./lib/dish.rb"

describe Dish do
  subject(:dish){ described_class.new("spring roll", 0.99) }

  it "dish should have attributes name, price" do
    expect(dish).to have_attributes( :name => "spring roll", :price => 0.99)
  end

end
