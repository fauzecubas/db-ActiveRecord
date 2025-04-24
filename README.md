Usei o esquema:
Person 1:1 Profile - Person tem 1 Profile
Person 1:N Posts - Person tem muitos Posts
Post N:N Tags - Post tem e pertence a muitas Tags

# Projeto Ruby com ActiveRecord

## Requisitos

- Ruby (>= 3.0)
- Bundler (`gem install bundler`)
- SQLite3

## Instalação

```bash
git clone <repo>
cd meu_projeto
bundle install

## Comandos

rake db:create   # Cria o banco de dados
rake db:migrate  # Executa as migrations
rake db:seed     # Popula o banco com os seeds
ruby db_manager.rb # Lista comandos e permite que o usuário execute-os