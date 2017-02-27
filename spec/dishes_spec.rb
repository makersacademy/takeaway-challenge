require 'dishes'

describe Dishes do

  let(:dishes_module) { Class.new { include Dishes } }

  xit "responds to the 'dish_list' method" do
      expect(dishes_module).to respond_to(:dish_list)
  end

  xit "returns an array" do
    expect(dishes_module.dish_list).to include Array
  end

end
