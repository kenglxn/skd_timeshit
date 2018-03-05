# Timeshit

Leser csv filer eksportert fra TidBank detaljert rapport og skriver ut timeføringsposter i tripletex vennlig format

## Usage

- Først last ned en csv rapport detaljert pr dag.
- Så les in filen med timeshit

    $ timeshit read <PATH_TO_CSV>

Du kan også filtrere på oppgave, dersom det er ønskelig med --filter option:

    $ timeshit read <PATH_TO_CSV> --filter 4010

## Demo



## Installation

Build with:

    $ rake build
    -> timeshit 0.0.1 built to pkg/timeshit-0.0.1.gem.

And then install:

    $ gem install pkg/timeshit-0.0.1.gem



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kenglxn/timeshit.
