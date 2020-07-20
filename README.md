<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/BRA_orthographic.svg/270px-BRA_orthographic.svg.png" align="right" />

# viacep ![Tests](https://github.com/vnbrs/viacep/workflows/Tests/badge.svg) [![GitHub license](https://img.shields.io/github/license/vnbrs/burocracia.cr.svg)](https://github.com/vnbrs/burocracia.cr/blob/master/LICENSE) 
> Dependency-less zipcode lookup gem for Brazilian addresses with an easy-to-use API and useful features such as timeout.

## Installing

You can easily install viacep through [RubyGems](https://rubygems.org/gems/viacep/):

```shell
gem install viacep
=> Rock on! 🚀
```

or add the following to your Gemfile:

```shell
gem "viacep"
```

## Usage

```ruby
require 'viacep'

# with unformatted zipcodes... =)
ViaCep::Address.new('80210130')
=> #<ViaCep::Address:0x00007fe52a8a0568 @cep="80210-130", @address="Rua José Ananias Mauad", @neighborhood="Jardim Botânico", @city="Curitiba", @state="PR", @ibge="4106902", @gia="">

# with formatted zipcodes... =)
ViaCep::Address.new('13035-680')
=> #<ViaCep::Address:0x00007fe52a99e730 @cep="13035-680", @address="Avenida João Jorge", @neighborhood="Vila Industrial", @city="Campinas", @state="SP", @ibge="3509502", @gia="2446">

# or even an nonexistent zipcode... =(
ViaCep::Address.new('12345678')
=> exception thrown: ViaCep::ApiRequestError

# and specifying a timeout in seconds... =)
ViaCep::Address.new('80210130', timeout: 0.2)
=> exception thrown: Timeout::Error (execution expired)
```

## Contributing

1. Create a fork (https://github.com/vnbrs/viacep/fork)
2. Create a branch (git checkout -b my-new-feature)
3. Make a commit  (git commit -am 'Add some feature')
4. Push your code (git push origin my-new-feature)
5. Create a Pull Request
6. Thanks! 🤙🏼
