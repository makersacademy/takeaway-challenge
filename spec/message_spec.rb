require 'message'

describe Message do
  subject("message") {described_class.new}

  it {is_expected.to respond_to :send_text}

end
