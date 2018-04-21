# ViaCEP
Gem responsável por buscar endereços a partir do CEP utilizando a API do ViaCEP com features úteis como timeout.

# Como usar?

```ruby
require 'viacep'

ViaCep::Address.new('80210130')
=> #<ViaCep::Address:0x00007fe52a8a0568 @cep="80210-130", @address="Rua José Ananias Mauad", @neighborhood="Jardim Botânico", @city="Curitiba", @state="PR", @ibge="4106902", @gia="">
```
