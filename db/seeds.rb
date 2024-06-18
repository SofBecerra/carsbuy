Car.destroy_all
User.destroy_all

cars = [
  { brand: 'Toyota', model: 'Toyota Corolla', year: 2015, kms: 46911, price: 20000, color: 'Rojo', information: 'Este auto tiene 46911 kms. Razones para comprarlo: confiabilidad, eficiencia en el consumo de combustible, y bajo costo de mantenimiento.', imagen1: 'imagen1_1.jpg', imagen2: 'imagen1_2.jpg' },
  { brand: 'Honda', model: 'Honda Civic', year: 2018, kms: 4118, price: 22500, color: 'Azul', information: 'Este auto tiene 4118 kms. Razones para comprarlo: diseño moderno, rendimiento eficiente y alta seguridad.', imagen1: 'imagen2_1.jpg', imagen2: 'imagen2_2.jpg' },
  { brand: 'Ford', model: 'Ford Focus', year: 2017, kms: 45948, price: 23000, color: 'Negro', information: 'Este auto tiene 45948 kms. Razones para comprarlo: manejo ágil, tecnología avanzada y diseño atractivo.', imagen1: 'imagen3_1.jpg', imagen2: 'imagen3_2.jpg' },
  { brand: 'Chevrolet', model: 'Chevrolet Malibu', year: 2019, kms: 1257, price: 25000, color: 'Blanco', information: 'Este auto tiene 1257 kms. Razones para comprarlo: espacioso interior, comodidad y gran desempeño.', imagen1: 'imagen4_1.jpg', imagen2: 'imagen4_2.jpg' },
  { brand: 'BMW', model: 'BMW Serie 3', year: 2020, kms: 29322, price: 28000, color: 'Gris', information: 'Este auto tiene 29322 kms. Razones para comprarlo: lujo, rendimiento deportivo y tecnología innovadora.', imagen1: 'imagen5_1.jpg', imagen2: 'imagen5_2.jpg' },
  { brand: 'Toyota', model: 'Toyota Camry', year: 2016, kms: 36111, price: 22000, color: 'Rojo', information: 'Este auto tiene 36111 kms. Razones para comprarlo: rendimiento confiable, espacio interior y alta eficiencia de combustible.', imagen1: 'imagen6_1.jpg', imagen2: 'imagen6_2.jpg' },
  { brand: 'Honda', model: 'Honda Accord', year: 2018, kms: 5118, price: 23500, color: 'Azul', information: 'Este auto tiene 5118 kms. Razones para comprarlo: diseño elegante, interior cómodo y buen rendimiento.', imagen1: 'imagen7_1.jpg', imagen2: 'imagen7_2.jpg' },
  { brand: 'Ford', model: 'Ford Fusion', year: 2017, kms: 35948, price: 24000, color: 'Negro', information: 'Este auto tiene 35948 kms. Razones para comprarlo: buen manejo, tecnología avanzada y diseño moderno.', imagen1: 'imagen8_1.jpg', imagen2: 'imagen8_2.jpg' },
  { brand: 'Chevrolet', model: 'Chevrolet Impala', year: 2019, kms: 2257, price: 27000, color: 'Blanco', information: 'Este auto tiene 2257 kms. Razones para comprarlo: espacioso, confortable y buen rendimiento.', imagen1: 'imagen9_1.jpg', imagen2: 'imagen9_2.jpg' },
  { brand: 'BMW', model: 'BMW Serie 5', year: 2020, kms: 19322, price: 30000, color: 'Gris', information: 'Este auto tiene 19322 kms. Razones para comprarlo: lujo, tecnología avanzada y gran desempeño.', imagen1: 'imagen10_1.jpg', imagen2: 'imagen10_2.jpg' }
]

cars.each do |car|
  Car.create!(car)
end

puts "#{cars.count} cars created"

users = [
  { name: 'María', last_name: 'Flores', email: 'maría.flores@gmail.com', password: '662818' },
  { name: 'José', last_name: 'González', email: 'josé.gonzález@hotmail.com', password: '453531' },
  { name: 'Luis', last_name: 'González', email: 'luis.gonzález@yahoo.com', password: '877552' },
  { name: 'José', last_name: 'Martínez', email: 'josé.martínez@hotmail.com', password: '998197' },
  { name: 'Carlos', last_name: 'Flores', email: 'carlos.flores@yahoo.com', password: '535966' },
  { name: 'Ana', last_name: 'Pérez', email: 'ana.pérez@gmail.com', password: '342251' },
  { name: 'Laura', last_name: 'Gómez', email: 'laura.gómez@hotmail.com', password: '734562' },
  { name: 'Juan', last_name: 'Díaz', email: 'juan.díaz@yahoo.com', password: '482190' },
  { name: 'Pedro', last_name: 'López', email: 'pedro.lópez@gmail.com', password: '625891' },
  { name: 'Sofía', last_name: 'Martínez', email: 'sofia.martínez@gmail.com', password: '978431' }
]

users.each do |user|
  User.create!(user)
end

puts "#{users.count} users created"
