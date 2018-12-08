require 'takeaway.rb'

describe Takeaway do

it 'it shows a list of dishes with prices' do
    takeaway = Takeaway.new
    takeaway.list
    expect(takeaway.list).to include(include('Dripping chips' => '3'))
end

end