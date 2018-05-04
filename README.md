# Berycoin::Gem

Welcome to Berycoin gem for Ruby and Rails developers, it helps you interact with Berycoin node,
It is really a wrapper for berycoin

```ruby 
puts Berycoin::Blockchain::getnewaddress
bery_info =  Berycoin::Control::getinfo
puts bery_info["version"]
puts bery_info["protocolversion"]

puts Berycoin::Wallet::listaccounts
@balance = Berycoin::Wallet::getbalance
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'berycoin-gem'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install berycoin-gem




##### Create Configuration file

cd to your data directory, e.g home/yourusername/.berycoin

```
 sudo nano berycoin.conf
```
Create a configuration file with this information

that has this information

    rpcuser=yourrpcusername
    rpcpass=yourrpcpassword
    rpchost=localhost
    rpcport=4732

##### Create Environment Variables

```
export RPCUSER=<yourrpcusername>
export RPCPASS=<yourrpcpassword>
export RPCHOST=<localhost>
export RPCPORT=<rpcport>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/berycoin-project/berycoin-gem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Berycoin::Gem project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/berycoin-gem/blob/master/CODE_OF_CONDUCT.md).
