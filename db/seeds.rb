# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


personnel = Personnel.create(id: '1234567890', email: 'root@cu.com', role: 'I', password: 'dbdbdbdb')

for i in 0..25
  personnel = Personnel.create(id: '12' + i.to_s, email: 'test' + i.to_s + '@cu.com' , role: 'I', password: 'dbdbdbdb')
  puts personnel.errors.messages
end

