AdminUser.create!(email: 'admin@admin.com', password: '123123', password_confirmation: '123123') if Rails.env.development?
Region.find_or_create(name: 'Riadyh')