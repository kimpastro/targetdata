# Targetdata
Integrates with Targetdata Smart API.

## Resources
Get person by it CPF

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'targetdata'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install targetdata

## Usage

```ruby
Targetdata.configure do |config|
    config.username      = username
    config.password      = password
    config.company_id    = company_id
    config.client_secret = client_secret
end

# Find by CPF
cpf = '88899988811'
person = Targetdata.person_by_cpf cpf

# Person's attributes
person.cpf
person.first_name
person.middle_name
person.last_name
person.gender
person.birth
person.status_receita_federal
person.rg_number
person.rg_orgao_emissor
person.rg_uf
person.voter_registration
person.death
person.nationality
person.minor
person.marital_status
person.mother_first_name
person.mother_middle_name
person.mother_last_name
person.schooling
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/targetdata. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/targetdata/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Targetdata project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/targetdata/blob/master/CODE_OF_CONDUCT.md).
