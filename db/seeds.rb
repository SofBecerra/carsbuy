# db/seeds.rb

require 'open-uri'

# Destruir todos los registros previos
Car.destroy_all
User.destroy_all

# Crear usuarios
users = [
  { first_name: "Juan", last_name: "Perez", email: 'juan.perez@example.com', password: '123456', rating: 4 },
  { first_name: "Ana", last_name: "Gomez", email: 'ana.gomez@example.com', password: '234567', rating: 5 },
  { first_name: "Luis", last_name: "Martinez", email: 'luis.martinez@example.com', password: '345678', rating: 3 },
  { first_name: "Carmen", last_name: "Lopez", email: 'carmen.lopez@example.com', password: '456789', rating: 4 },
  { first_name: "Miguel", last_name: "Hernandez", email: 'miguel.hernandez@example.com', password: '567890', rating: 5 }
]

users.each do |user_data|
  User.create!(user_data)
end

puts "#{users.count} users created"

# Obtener todos los usuarios creados
created_users = User.all

# Crear autos y asignarlos a los usuarios
cars = [
  { brand: "Toyota", year: 2015, price: 20000, color: "Rojo", information: "Toyota Corolla, excelente estado, único dueño.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746514/imagen1_1_hs6del.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746758/imagen1_2_saitev.webp"] },
  { brand: "Honda", year: 2018, price: 22500, color: "Azul", information: "Honda Civic, bajo kilometraje, todas las revisiones al día.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746762/imagen2_1_fh9hpq.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746768/imagen2_2_hktuaq.webp"] },
  { brand: "Ford", year: 2017, price: 23000, color: "Negro", information: "Ford Focus, perfecto para la ciudad, muy económico.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746773/imagen3_1_hlnehr.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746778/imagen3_2_s4w3wd.webp"] },
  { brand: "Chevrolet", year: 2019, price: 25000, color: "Blanco", information: "Chevrolet Malibu, amplio y cómodo, ideal para familias.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746782/imagen4_1_iveicg.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746959/imagen4_2_ykqbda.webp"] },
  { brand: "BMW", year: 2020, price: 28000, color: "Gris", information: "BMW Serie 3, lujo y potencia en un solo paquete.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747231/imagen5_1_cm5raj.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747246/imagen5_2_v0vza0.webp"] },
  { brand: "Audi", year: 2016, price: 27000, color: "Verde", information: "Audi A4, diseño elegante y gran rendimiento.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747252/imagen6_1_fstoiq.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747258/imagen6_2_xrlcpi.webp"] },
  { brand: "Mercedes", year: 2015, price: 30000, color: "Amarillo", information: "Mercedes Benz C-Class, seguridad y confort de alta gama.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747265/imagen7_1_bjoyqu.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747270/imagen7_2_iskiba.webp"] },
  { brand: "Volkswagen", year: 2018, price: 24000, color: "Naranja", information: "Volkswagen Jetta, buen rendimiento de combustible.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747275/imagen8_1_dvfgkl.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747281/imagen8_2_tlsvzu.webp"] },
  { brand: "Nissan", year: 2017, price: 22000, color: "Plateado", information: "Nissan Altima, diseño moderno y tecnología avanzada.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747287/imagen9_1_gyqos6.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747292/imagen9_2_hw8ase.webp"] },
  { brand: "Kia", year: 2020, price: 26000, color: "Morado", information: "Kia Forte, confiable y económico, ideal para jóvenes.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747411/imagen10_1_lh4huo.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747442/imagen10_2_zxdvcg.webp"] }
]

cars.each do |car_data|
  user = created_users.sample
  car = Car.new(
    brand: car_data[:brand],
    year: car_data[:year],
    price: car_data[:price],
    color: car_data[:color],
    information: car_data[:information],
    user: user
  )

  if car.save
    car_data[:photos].each do |photo_url|
      downloaded_image = URI.open(photo_url)
      car.photos.attach(io: downloaded_image, filename: File.basename(URI.parse(photo_url).path))
    end
  end
end

puts "#{cars.count} cars created"
