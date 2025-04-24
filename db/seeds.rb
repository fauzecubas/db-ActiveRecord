# db/seeds.rb

# Criando pessoas e seus perfis
person1 = Person.create(first_name: "Tove", last_name: "Svendson", address: "Borgvn 23", city: "Sandnes")
profile1 = Profile.create(bio: "Desenvolvedora", person: person1)
post1 = Post.create(title: "Meu Primeiro Post", content: "Conteúdo do post", person: person1)
tag1 = Tag.create(name: "Ruby")
post1.tags << tag1

person2 = Person.create(first_name: "Carlos", last_name: "Silva", address: "Rua A, 12", city: "Rio de Janeiro")
profile2 = Profile.create(bio: "Analista de Sistemas", person: person2)
post2 = Post.create(title: "Dicas de Ruby", content: "Aqui estão algumas dicas sobre Ruby.", person: person2)
tag2 = Tag.create(name: "Ruby")
post2.tags << tag2

person3 = Person.create(first_name: "Ana", last_name: "Oliveira", address: "Av. Central, 45", city: "São Paulo")
profile3 = Profile.create(bio: "Engenheira de Software", person: person3)
post3 = Post.create(title: "O que é programação funcional?", content: "Programação funcional é um paradigma de programação.", person: person3)
tag3 = Tag.create(name: "Programação Funcional")
post3.tags << tag3

person4 = Person.create(first_name: "João", last_name: "Pereira", address: "Rua B, 123", city: "Fortaleza")
profile4 = Profile.create(bio: "Programador Web", person: person4)
post4 = Post.create(title: "Introdução ao Rails", content: "Rails é um framework de desenvolvimento web.", person: person4)
tag4 = Tag.create(name: "Rails")
post4.tags << tag4

person5 = Person.create(first_name: "Lucia", last_name: "Costa", address: "Rua das Flores, 56", city: "Belo Horizonte")
profile5 = Profile.create(bio: "Desenvolvedora Front-End", person: person5)
post5 = Post.create(title: "Frontend ou Backend?", content: "As diferenças entre o frontend e o backend.", person: person5)
tag5 = Tag.create(name: "Frontend")
post5.tags << tag5

person6 = Person.create(first_name: "Ricardo", last_name: "Souza", address: "Rua C, 78", city: "Salvador")
profile6 = Profile.create(bio: "Desenvolvedor Full-Stack", person: person6)
post6 = Post.create(title: "O que é um desenvolvedor Full-Stack?", content: "Um desenvolvedor Full-Stack trabalha com front-end e back-end.", person: person6)
tag6 = Tag.create(name: "Full-Stack")
post6.tags << tag6

person7 = Person.create(first_name: "Mariana", last_name: "Lima", address: "Av. Brasil, 99", city: "Curitiba")
profile7 = Profile.create(bio: "Desenvolvedora Backend", person: person7)
post7 = Post.create(title: "API em Ruby on Rails", content: "Aprenda a construir APIs usando Rails.", person: person7)
tag7 = Tag.create(name: "API")
post7.tags << tag7

person8 = Person.create(first_name: "Paulo", last_name: "Silveira", address: "Rua D, 34", city: "Porto Alegre")
profile8 = Profile.create(bio: "Consultor de TI", person: person8)
post8 = Post.create(title: "Como melhorar a performance de seu site", content: "Algumas dicas para melhorar a performance de sites.", person: person8)
tag8 = Tag.create(name: "Performance")
post8.tags << tag8

person9 = Person.create(first_name: "Fernanda", last_name: "Martins", address: "Rua E, 22", city: "Recife")
profile9 = Profile.create(bio: "Engenheira de Software", person: person9)
post9 = Post.create(title: "Refatoração de código", content: "O que é refatoração de código e quando utilizá-la.", person: person9)
tag9 = Tag.create(name: "Refatoração")
post9.tags << tag9

person10 = Person.create(first_name: "Roberto", last_name: "Oliveira", address: "Rua F, 101", city: "Natal")
profile10 = Profile.create(bio: "Arquiteto de Software", person: person10)
post10 = Post.create(title: "Design Patterns", content: "Introdução aos principais Design Patterns.", person: person10)
tag10 = Tag.create(name: "Design Patterns")
post10.tags << tag10

puts "10 pessoas, seus perfis, posts e tags foram criados!"
