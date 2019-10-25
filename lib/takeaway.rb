require "json"


class Takeaway
    attr_reader :menu
    def initialize
        @menu = JSON.parse(File.read('./menu.json'))["menu"]
    end
end