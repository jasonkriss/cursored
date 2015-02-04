module Cursored
  def self.configure
    yield config
  end

  def self.config
    @config ||= Configuration.new
  end

  class Configuration
    attr_accessor :field, :limit

    def initialize
      @field = :id
      @limit = 25
    end
  end
end
