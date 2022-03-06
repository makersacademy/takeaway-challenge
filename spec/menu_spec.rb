require_relative '../lib/menu'

describe Menu do
  # 1. As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it "contains dishes and prices" do
    menu = {
      'rice' => 2,
      'chicken' => 3,
      'soup' => 2
    }
    expect(subject.menu_list).to eq menu
  end
end
