require 'active_record'
require 'yaml'
require 'erb'
require 'logger'

require 'psych'
DB_CONFIG = Psych.safe_load(ERB.new(File.read('config/database.yml')).result, aliases: true)['development']

ActiveRecord::Base.establish_connection(DB_CONFIG)
ActiveRecord::Base.logger = Logger.new($stdout)

Dir["app/models/*.rb"].each { |file| require_relative "../#{file}" }
