require_relative '../config/environment'

# Definir as operações diretamente no código
operations = [
  { operation: "insere", table: "people", attributes: { first_name: "João", last_name: "Silva", address: "Rua Exemplo", city: "São Paulo" } },
  { operation: "insere", table: "people", attributes: { first_name: "Maria", last_name: "Souza", address: "Rua Teste", city: "Rio de Janeiro" } },
  { operation: "insere", table: "people", attributes: { first_name: "Carlos", last_name: "Almeida", address: "Avenida Brasil", city: "Curitiba" } },
  { operation: "insere", table: "people", attributes: { first_name: "Ana", last_name: "Costa", address: "Rua das Flores", city: "Belo Horizonte" } },
  # Adicionar mais operações conforme necessário
]

# Loop pelas operações e executa cada uma
operations.each do |op|
  model = Object.const_get(op[:table].capitalize.singularize)

  case op[:operation]
  when "insere"
    model.create(op[:attributes])
  when "altera"
    record = model.find_by(op[:attributes].slice('id'))
    record.update(op[:attributes].reject { |k, _| k == 'id' }) if record
  when "exclui"
    record = model.find_by(op[:attributes])
    record.destroy if record
  when "lista"
    model.all.each { |r| puts r.attributes }
  else
    puts "Operação inválida: #{op[:operation]}"
  end
end
