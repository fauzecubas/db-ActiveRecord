# cli.rb
require_relative 'app/models/person'
require_relative 'app/models/profile'
require_relative 'app/models/post'
require_relative 'app/models/tag'

command = ARGV.shift
table = ARGV.shift
attributes = ARGV.map { |arg| arg.split('=') }.to_h

case command
when 'insere'
  Object.const_get(table.capitalize).create(attributes)
when 'altera'
  record = Object.const_get(table.capitalize).find_by(id: attributes.delete('id'))
  record.update(attributes) if record
when 'exclui'
  record = Object.const_get(table.capitalize).find_by(id: attributes['id'])
  record.destroy if record
when 'lista'
  records = Object.const_get(table.capitalize).all
  records.each { |r| puts r.attributes }
else
  puts "Comando inválido."
end