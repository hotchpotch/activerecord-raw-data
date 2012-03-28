# ActiveRecord::RawData

[![Build Status](https://secure.travis-ci.org/hotchpotch/activerecord-raw-data.png?branch=master)](http://travis-ci.org/hotchpotch/activerecord-raw-data)

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

    User.raw_data
    #=> [{"id" => 1, "name" => "alice"}, {"id" => 2, "name" => "bob"}, ...]

    User.raw_rows
    #=> [[1, "alice"], [2, "bob"], ...]

    # raw_values like ActiveRecord::Base.pluck. if your AR support, should use pluck.
    User.select(:name).raw_values
    #=> ["alice", "bob", ...]

    User.raw_data_by_sql('SELECT SUBSTR(name, 1, 1) AS initial FROM users ORDER BY users.name DESC')
    #=> [{"initial" => "c"}, {"initial" => "b"}, ...]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Author

Yuichi Tateno
