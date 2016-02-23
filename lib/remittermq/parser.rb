require 'json'

module REmittermq
  class Parser
    def self.parse(file)
      raise NonValidFileException, "Only .json are valid" unless json?(file)

      json = File.read(file)
      JSON.parse(json)
    end

    private

    def self.json?(file)
      File.extname(file) == ".json"
    end
  end
end