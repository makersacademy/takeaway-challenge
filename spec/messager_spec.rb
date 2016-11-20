require './lib/messager'

describe Messager do

it "should provide a delivery time" do
  expect(subject).to respond_to(:delivery_time)
end


end
