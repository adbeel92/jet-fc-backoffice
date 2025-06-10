return if Admin.exists?

Admin.create!(email: 'adbeel92@gmail.com', password: 'password')
