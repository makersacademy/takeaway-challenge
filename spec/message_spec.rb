require 'message'

describe Message do

   it {is_expected.to respond_to(:send).with(1).argument}
  
end