return if Admin.exists?

Admin.create!(name: 'Eduardo Arenas', email: 'adbeel92@gmail.com', password: 'password')
