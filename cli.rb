require_relative 'config/environment'

operation, table, *args = ARGV
attributes = args.map { |arg| arg.split('=') }.to_h

model = Object.const_get(table.capitalize.singularize)

case operation
when "insere"
  model.create(attributes)
when "altera"
  record = model.find_by(attributes.slice('id'))
  record.update(attributes.reject { |k, _| k == 'id' }) if record
when "exclui"
  record = model.find_by(attributes)
  record.destroy if record
when "lista"
  model.all.each { |r| puts r.attributes }
else
  puts "Operação inválida."
end
