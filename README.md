# Spine::Hub

[![Code Climate](https://codeclimate.com/github/rspine/hub/badges/gpa.svg)](https://codeclimate.com/github/rspine/hub)

Provides Publish/Subscribe pattern.

## Installation

To install it, add the gem to your Gemfile:

```ruby
gem 'spine-hub'
```

Then run `bundle`. If you're not using Bundler, just `gem install spine-hub`.

## Usage

```ruby
class Service
  include Spine::Hub::Publisher

  def action
    publish(:action_executing)
    # ...
    publish(:action_executed, 'OK')
  end
end

class Listener
  include Spine::Hub::Subscriber

  def on_action_executing
    puts 'Executing action'
  end
end

service = Service.new
service.subscribe(Listener)
service.on(:action_executed) do |status|
  puts "Action executed: #{ status }"
end
service.action
```

There is also `Spine::Hub::Repeater`, which repeats subscribed events. If you
need to get more control over subscriber event handling, implement notify
method:

```ruby
class MySubscriber
  def notify(event, *arguments)
    # Handle events
  end
end
```
