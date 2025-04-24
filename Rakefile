require 'active_record'
require 'yaml'
require 'erb'
require 'rake'
require_relative './config/environment'

namespace :db do
  desc "Cria o banco de dados"
  task :create do
    ActiveRecord::Base.establish_connection(DB_CONFIG)
    ActiveRecord::Base.connection
  end

  desc "Executa as migrations"
  task :migrate do
    ActiveRecord::MigrationContext.new('db/migrate', ActiveRecord::SchemaMigration).migrate
  end

  desc "Popula o banco com os seeds"
  task :seed do
    load 'db/seeds.rb'
  end
end
