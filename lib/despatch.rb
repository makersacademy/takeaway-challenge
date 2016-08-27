class Despatch

# => `export SOME_API_KEY="qwerty123456"`in Ruby as `ENV["SOME_API_KEY"]`

  def send_order

  end

  def estimate_eta
    eta_time = Time.now + (60*60)
    "#{eta_time.hour}:#{eta_time.min}"
  end

end
