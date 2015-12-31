module Spine
  module Hub
    module Subscriptions
      module Global
        def subscribers
          super + Hub.subscribers
        end
      end
    end
  end
end
