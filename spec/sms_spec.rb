require 'sms'

describe Sms do
  it 'can read the env constants' do
    expect(subject.my_number_env).to eq("+447795537261")
  end
end
