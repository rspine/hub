module Spine
  module Hub
    autoload :Publisher, 'spine/hub/publisher'
    autoload :Subscriber, 'spine/hub/subscriber'
    autoload :Repeater, 'spine/hub/repeater'

    module Subscriptions
      autoload :Closure, 'spine/hub/subscriptions/closure'
    end
  end
end
