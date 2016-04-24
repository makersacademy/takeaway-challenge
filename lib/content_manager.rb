class ContentManager

  attr_reader :person

  def initialize(person)
    @person = person
  end

  def set_eta
    current_time = Time.now
    Time.now + 60*60
  end
end