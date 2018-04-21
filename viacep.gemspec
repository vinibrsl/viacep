Gem::Specification.new do |s|
  s.name          = 'viacep'
  s.version       = '1.0.1'
  s.date          = '2011-09-29'
  s.summary       = 'Gem responsável por buscar endereços a partir do CEP utilizando a API do ViaCEP com features úteis como timeout.'
  s.authors       = ['Vinicius Brasil (@vnbrs)']
  s.email         = 'vnbrs@icloud.com'
  s.license       = 'MIT'

  s.require_paths = ['lib']
  s.files         = ['lib/viacep.rb', 'lib/service.rb', 'lib/exceptions.rb']

  s.add_development_dependency 'rspec', '~> 3.7'
  s.add_dependency 'httparty', '~> 0.13.7'
end
