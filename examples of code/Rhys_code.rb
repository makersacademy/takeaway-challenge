class TextNote

  attr_reader :note

  def initialize
    @note = { note: nil, tag: nil }
  end

  def create_note(text)
    @note[:note] = text
  end

  def set_tag(tag)
    @note[:tag] = tag
  end

end
