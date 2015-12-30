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

        def subscribe(*subscribers)
          @subscribers += subscribers
        end

        def clear
          @subscribers = Set.new
        end

        def self.subscribe(*subscribers)
          instance.subscribe(*subscribers)
        end

        def self.subscribers
          instance.subscribers
        end

        def self.clear
          instance.clear
        end
      end

    end
  end
end
