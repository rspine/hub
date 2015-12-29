require 'set'
require 'singleton'

module Spine
  module Hub
    module Subscriptions
      class Global
        include Singleton

        def initialize
          @subscribers = Set.new
        end

        attr_reader :subscribers

        def add(*subscribers)
          @subscribers += subscribers
        end

        def self.add(*subscribers)
          instance.add(*subscribers)
        end

        def self.subscribers
          instance.subscribers
        end
      end

    end
  end
end
