require 'time'

module Hour
  def self.one_ahead
    t = Time.now + (60 * 60)
    t.strftime('%H:%M')
  end
end
