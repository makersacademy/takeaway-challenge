module FakeSms
  Message = Struct.new(:from, :to, :body)

    def self.new(sid, token)
      @messages = []
    end

    def self.create
      @messages << Message.new(:from, :to, :body)
    end

    def self.messages
      @messages
    end

end
