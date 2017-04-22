require 'Terminal'
RSpec.describe Terminal do

describe '#view_menu' do
  it {is_expected.to respond_to(:view_menu)}
end

describe '#add_to_order' do
  it {is_expected.to respond_to(:add_to_order)}
end


end
