# config/environment.rb
require 'active_record'
require 'yaml'
require 'erb'

# Conectar ao banco de dados
db_config = YAML.load(ERB.new(File.read('config/database.yml')).result, aliases: true)
ActiveRecord::Base.establish_connection(db_config['development'])

# Carregar os modelos
Dir["./app/models/*.rb"].each { |file| require file }