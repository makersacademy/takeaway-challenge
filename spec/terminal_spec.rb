require 'Terminal'
RSpec.describe Terminal do

describe '#view_menu' do
  it {is_expected.to respond_to(:view_menu)}
end

describe '#order' do
  it {is_expected.to respond_to(:order)}
end
end
