Gem::Specification.new do |s|
  s.name          = 'viacep'
  s.version       = '2.0.0'
  s.date          = '2018-05-02'
  s.summary       = 'Gem responsável por buscar endereços a partir do CEP utilizando a API do ViaCEP com features úteis como timeout.'
  s.authors       = ['Vinicius Brasil (@vnbrs)']
  s.email         = 'vnbrs@icloud.com'
  s.license       = 'MIT'

  s.require_paths = ['lib']
  s.files         = ['lib/address.rb', 'lib/service.rb', 'lib/exceptions.rb']

  s.add_development_dependency 'rspec', '~> 3.7'
  s.add_development_dependency 'yard', '~> 0.8.7.6'
  s.add_development_dependency 'redcarpet', '~> 3.4'
end
