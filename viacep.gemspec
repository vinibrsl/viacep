Gem::Specification.new do |s|
  s.name          = 'viacep'
  s.version       = '2.0.1'
  s.date          = '2018-05-02'
  s.summary       = 'Gem sem dependências e fácil de usar para busca de endereços a partir do CEP utilizando o ViaCEP'
  s.authors       = ['Vinicius Brasil (@vnbrs)']
  s.email         = 'marcosbrasilaraujo@gmail.com'
  s.license       = 'MIT'

  s.require_paths = ['lib']
  s.files         = ['lib/address.rb', 'lib/service.rb', 'lib/exceptions.rb']

  s.add_development_dependency 'rspec', '~> 3.7'
  s.add_development_dependency 'yard', '~> 0.9.11'
end
