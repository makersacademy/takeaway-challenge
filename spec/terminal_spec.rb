require 'Terminal'
RSpec.describe Terminal do

describe '#view_menu' do
  it {is_expected.to respond_to(:view_menu)}
  it {is_expected.to respond_to(:order)}
end
end
