require 'messager'

describe Messager do

  subject(:messager) { described_class.new(config) }
  let(:msg_config) { {
        account_sid: "abc",
        auth_token: "abc",
        body: "Thank you! Your order was placed and will be delivered before ",
        to: "+12345",
        from: "+12345"
        } }


end
