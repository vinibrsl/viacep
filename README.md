<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/BRA_orthographic.svg/270px-BRA_orthographic.svg.png" align="right" />

# viacep [![GitHub license](https://img.shields.io/github/license/vnbrs/burocracia.cr.svg)](https://github.com/vnbrs/burocracia.cr/blob/master/LICENSE) 
> Gem responsável por buscar endereços a partir do CEP utilizando a API do ViaCEP com features úteis como timeout.

## Instalação

Instale o viacep pelo [RubyGems](https://rubygems.org/gems/viacep/) facilmente via terminal:

```shell
gem install viacep
=> Vai que é tua! 🚀
```

ou...

```shell
bundle add viacep
=> Gem instalada no Gemfile! 🤓
```

## Como usar?

```ruby
require 'viacep'

# com CEPs sem formatação...
ViaCep::Address.new('80210130')
=> #<ViaCep::Address:0x00007fe52a8a0568 @cep="80210-130", @address="Rua José Ananias Mauad", @neighborhood="Jardim Botânico", @city="Curitiba", @state="PR", @ibge="4106902", @gia="">

# com CEPs formatados...
ViaCep::Address.new('13035-680')
=> #<ViaCep::Address:0x00007fe52a99e730 @cep="13035-680", @address="Avenida João Jorge", @neighborhood="Vila Industrial", @city="Campinas", @state="SP", @ibge="3509502", @gia="2446">

# um CEP não existente...
ViaCep::Address.new('12345678')
=> exception thrown: ViaCep::ApiRequestError

# especificando um timeout em segundos...
ViaCep::Address.new('80210130', timeout: 0.2)
=> exception thrown: Timeout::Error (execution expired)
```

## Contribuindo

1. Faça um fork (https://github.com/vnbrs/viacep/fork)
2. Crie uma branch (git checkout -b my-new-feature)
3. Faça um commit  (git commit -am 'Add some feature')
4. Faça o push (git push origin my-new-feature)
5. Crie um Pull Request
6. Valeu! 🤙🏼

## Contribuidores

- [vnbrs](https://github.com/vnbrs) Vinicius Brasil - creator, maintainer
