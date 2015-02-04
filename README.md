# Cursored

Super simple cursor-based pagination.

## Installation

Add this line to your application's Gemfile:

    gem 'cursored'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cursored

Finally:

    $ rails g cursored:install

## Usage

Simply use `render_cursored` in your controller actions:

```ruby
def index
  render_cursored(Item.all)
end
```

## Contributing

1. Fork it ( http://github.com/jasonkriss/cursored/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
