require "text"

describe Text_sender do

  it "" do
    expect(subject.delivery_time).to include Time.now+3600
  end
  
end