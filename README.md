# CurrencyByIp

Guess the currency to show a user from their IP address. This uses GeoIP’s IP
database.

## Installation

Add the following lines to your application’s Gemfile:

```ruby
# Detect the currency from an IP address
gem "currency_by_ip"
```

And then execute:

```sh
$ bundle
```

## GeoIP

Download an up-to-date decompressed GeoIP `.dat` file from
https://www.miyuru.lk/geoiplegacy and place it somewhere in your app,
like `config/geo_lite_2.dat`.

## Usage

```ruby
CurrencyByIp.find_by_ip(
  "173.194.34.1",
  geoip_data_path: "config/geo_lite_2.dat",
) # => "USD"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then,
run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem on your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, commit,
and then run `bundle exec rake release` to create a git tag for the version,
push git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

Run the specs with:

```sh
$ bundle exec rspec
```

## Contributing

1. Fork it ( https://github.com/sunny/currency_by_ip/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
6. Dance
