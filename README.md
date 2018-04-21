# ViaCEP
Gem responsável por buscar endereços a partir do CEP utilizando a API do ViaCEP com features úteis como timeout.

# Como usar?

```ruby
require 'viacep'

# com CEPs sem formatação...
ViaCep::Address.new('80210130')
=> #<ViaCep::Address:0x00007fe52a8a0568 @cep="80210-130", @address="Rua José Ananias Mauad", @neighborhood="Jardim Botânico", @city="Curitiba", @state="PR", @ibge="4106902", @gia="">

# com CEPs formatados...
ViaCep::Address.new('13035-680')
=> #<ViaCep::Address:0x00007fe52a99e730 @cep="13035-680", @address="Avenida João Jorge", @neighborhood="Vila Industrial", @city="Campinas", @state="SP", @ibge="3509502", @gia="2446">

# um CEP não existente...
ViaCep::Address.new('123')
=> ViaCep::AddressNotFound (the API responded with HTTP 404)

# especificando um timeout em segundos...
ViaCep::Address.new('80210130', timeout: 0.2)
=> Timeout::Error (execution expired)
```

# Como instalar?
Instale o ViaCEP pelo RubyGems facilmente via terminal:
```
gem install viacep
=> You're good to go! 🚀
```
