admin = AdminUser.create(email: "admin@example.com", password: "password", password_confirmation: "password")
puts "Admin created: " << admin.email
