# ActiveRecord::RawData

Get ActiveRecord raw data. Hash, Array..

## Requirements

ActiveRecord Version ">= 3.0.0"

## Installation

Add this line to your application's Gemfile:

    gem 'activerecord-raw-data'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-raw-data

## Usage

    User.raw_data #=> [{"id" => 1, "name" => "alice"}, {"id" => 2, "name" => "bob"}, ...]
    User.raw_rows #=> [[1, "alice"], [2, "bob"], ...]
    # raw_values like ActiveRecord::Base.pluck. if your AR support, should use pluck.
    User.select(:name).raw_values #=> ["alice", "bob", ...]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
