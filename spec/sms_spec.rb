require 'sms'

describe Sms do
  it{ is_expected.to respond_to(:send).with(2).arguments }
end
