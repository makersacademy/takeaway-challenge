require 'text_message'

describe TextMessage do

  it {is_expected.to(respond_to(:send_message))}

end
