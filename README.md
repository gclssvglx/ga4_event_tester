# GA4 Event Tester

An event tester for Google Analytics 4 (GA4)

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add ga4_event_tester

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install ga4_event_tester

## Usage

```bash
$ bin/run -e ENVIRONMENT  # Run on a specific environment
$ bin/run -a              # Run on all environments
$ bin/run -v              # Display the version
$ bin/run -h              # Display help
```

Valid environments are: integration, staging and production

### Testing

```bash
$ bundle exec rake
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ga4_event_tester.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
