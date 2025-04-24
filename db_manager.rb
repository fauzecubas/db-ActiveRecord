require 'active_record'
require 'sqlite3'

# Configuração do banco de dados (ajuste conforme necessário)
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.sqlite3'  # Ajuste o caminho do banco de dados conforme sua estrutura
)

# Carregar os modelos
require_relative 'app/models/person'
require_relative 'app/models/profile'
require_relative 'app/models/post'
require_relative 'app/models/tag'
require_relative 'app/models/post_tag'

# Função para processar os atributos
def parse_attributes(args)
  hash = {}

  args.each do |arg|
    key, value = arg.split('=')
    if value
      value = value.tr('"', '')  # Remove as aspas
      hash[key.to_sym] = value
    else
      puts "Aviso: valor de '#{key}' não encontrado."
    end
  end

  hash
end

# Função para processar o comando
def process_command(command)
  parts = command.split(' ')

  if parts.length < 2
    raise ArgumentError, "Comando inválido. É necessário pelo menos uma operação e o nome da tabela (ex: 'lista usuarios')."
  end

  operation = parts[0]
  table = parts[1].downcase # Convertendo para minúsculo para garantir que a tabela seja corretamente acessada
  attributes = parse_attributes(parts[2..-1])

  case operation
  when 'insere'
    model = Object.const_get(table.capitalize) # Obtém a classe do modelo, como 'Person'
    record = model.create(attributes)
    if record.persisted?
      puts "#{table.capitalize} inserido com sucesso!"
    else
      puts "Erro ao inserir #{table.capitalize}."
    end
  when 'altera'
    model = Object.const_get(table.capitalize)
    record = model.find_by(attributes)
    if record
      record.update(attributes)
      puts "#{table.capitalize} alterado com sucesso!"
    else
      puts "#{table.capitalize} não encontrado para alteração."
    end
  when 'exclui'
    model = Object.const_get(table.capitalize)
    record = model.find_by(attributes)
    if record
      record.destroy
      puts "#{table.capitalize} excluído com sucesso!"
    else
      puts "#{table.capitalize} não encontrado para exclusão."
    end
  when 'lista'
    model = Object.const_get(table.capitalize)
    records = model.all
    records.each do |r|
      puts r.attributes.inspect
      puts  # Adiciona uma linha em branco após cada registro
    end  
  else
    puts "Comando inválido. Comandos válidos: insere, altera, exclui e lista"
  end
end

# Main
puts "MANUAL"
puts "<operação> <tabela> {atributo = valor}"
puts "onde <operacao> pode ser 'insere', 'altera', 'exclui' e 'lista'"
puts "<tabela> indica o nome da tabela: Person, Profile, Post e Tag"
puts "{ ... } indica repetição"
puts "atributo = valor indica o valor do atributo envolvido na operação"

puts "EXEMPLOS"
puts "- insere person first_name=\"Tove\" last_name=\"Svendson\" address=\"Borgvn 23\" city=\"Sandnes\"):"
puts "- altera person first_name=\"Novo Nome\" last_name=\"Sobrenome Atualizado\" id=\"1\""
puts "- exclui person first_name=\"Nome Alvo\""
puts "- lista person"

# Loop principal para processar múltiplos comandos
loop do
  puts "Digite o comando abaixo (ou 'exit' para sair):"
  command = gets.chomp

  break if command.downcase == 'exit'  # Se o comando for 'exit', o loop será interrompido

  process_command(command)  # Processa o comando fornecido
end

puts "Programa encerrado."