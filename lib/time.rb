class Clock
  def times
    t = Time.now
    time = t.strftime('%H')
    time = time.to_i + 1
    time .to_s + t.strftime(':%M')
  end
end
