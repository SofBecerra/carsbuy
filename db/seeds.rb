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

#puts "#{users.count} users created"

# Obtener todos los usuarios creados
created_users = User.all

# Crear autos y asignarlos a los usuarios
cars = [
  { brand: "Toyota", year: 2015, price: 20000, color: "Rojo", available: true, information: "Toyota Corolla, excelente estado, único dueño.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746514/imagen1_1_hs6del.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746758/imagen1_2_saitev.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748201/imagen31_1_ivwegh.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748219/imagen31_2_k27eeg.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748320/imagen41_2_th22py.webp"] },
  { brand: "Honda", year: 2018, price: 22500, color: "Azul", available: true, information: "Honda Civic, bajo kilometraje, todas las revisiones al día.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746762/imagen2_1_fh9hpq.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746768/imagen2_2_hktuaq.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748216/imagen32_1_km0xv7.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748215/imagen32_2_txgir8.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748333/imagen42_2_ne9qoa.webp"] },
  { brand: "Ford", year: 2017, price: 23000, color: "Negro", available: true, information: "Ford Focus, perfecto para la ciudad, muy económico.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746773/imagen3_1_hlnehr.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746778/imagen3_2_s4w3wd.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748224/imagen33_1_ed4qpy.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748229/imagen33_2_a4mp9r.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748345/imagen43_2_ylvmag.webp"] },
  { brand: "Chevrolet", year: 2019, price: 25000, color: "Blanco", available: true, information: "Chevrolet Malibu, amplio y cómodo, ideal para familias.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746782/imagen4_1_iveicg.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746959/imagen4_2_ykqbda.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748234/imagen34_1_bpnw2d.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748244/imagen34_2_oqklbx.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748356/imagen44_2_hed9sk.webp"] },
  { brand: "BMW", year: 2020, price: 28000, color: "Gris", available: true, information: "BMW Serie 3, lujo y potencia en un solo paquete.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747231/imagen5_1_cm5raj.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747246/imagen5_2_v0vza0.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748245/imagen35_1_wn9ar1.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748252/imagen35_2_n35zbg.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748368/imagen45_2_eyvr24.webp"] },
  { brand: "Audi", year: 2016, price: 27000, color: "Verde", available: true, information: "Audi A4, diseño elegante y gran rendimiento.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747252/imagen6_1_fstoiq.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747258/imagen6_2_xrlcpi.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748258/imagen36_1_ogv2fs.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748265/imagen36_2_miudqo.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748500/imagen46_2_ik9nhk.webp"] },
  { brand: "Chevrolet", year: 2019, price: 25000, color: "Blanco", available: true, information: "Chevrolet Malibu, amplio y cómodo, ideal para familias.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746782/imagen4_1_iveicg.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746959/imagen4_2_ykqbda.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748234/imagen34_1_bpnw2d.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748244/imagen34_2_oqklbx.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748356/imagen44_2_hed9sk.webp"] },
  { brand: "BMW", year: 2020, price: 28000, color: "Gris", available: true, information: "BMW Serie 3, lujo y potencia en un solo paquete.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747231/imagen5_1_cm5raj.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747246/imagen5_2_v0vza0.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748245/imagen35_1_wn9ar1.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748252/imagen35_2_n35zbg.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748368/imagen45_2_eyvr24.webp"] },
  { brand: "Audi", year: 2016, price: 27000, color: "Verde", available: true, information: "Audi A4, diseño elegante y gran rendimiento.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747252/imagen6_1_fstoiq.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747258/imagen6_2_xrlcpi.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748258/imagen36_1_ogv2fs.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748265/imagen36_2_miudqo.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748500/imagen46_2_ik9nhk.webp"] },
  { brand: "Mercedes", year: 2015, price: 30000, color: "Amarillo", available: true, information: "Mercedes Benz C-Class, seguridad y confort de alta gama.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747265/imagen7_1_bjoyqu.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747270/imagen7_2_iskiba.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748272/imagen37_1_t4ui1m.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748282/imagen37_2_oooefo.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748510/imagen47_2_j2i8ju.webp"] },
  { brand: "Volkswagen", year: 2018, price: 24000, color: "Naranja", available: true, information: "Volkswagen Jetta, buen rendimiento de combustible.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747275/imagen8_1_dvfgkl.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747281/imagen8_2_tlsvzu.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748277/imagen38_1_t3dxtt.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748286/imagen38_2_qk8zq1.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746375/imagen48_2_qo6dxa.webp"] },
  { brand: "Nissan", year: 2017, price: 22000, color: "Plateado", available: true, information: "Nissan Altima, diseño moderno y tecnología avanzada.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747287/imagen9_1_gyqos6.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747292/imagen9_2_hw8ase.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748292/imagen39_1_azhlo7.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748297/imagen39_2_o9xy85.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746384/imagen49_2_e32sx3.webp"] },
  { brand: "Kia", year: 2020, price: 26000, color: "Morado", available: true, information: "Kia Forte, confiable y económico, ideal para jóvenes.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747411/imagen10_1_lh4huo.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747442/imagen10_2_zxdvcg.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748302/imagen40_1_aks5f7.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748307/imagen40_2_kj88a1.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746393/imagen50_2_m7uxc3.webp"] },
  { brand: "Toyota", year: 2015, price: 20000, color: "Rojo", available: true, information: "Toyota Corolla, excelente estado, único dueño.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747447/imagen11_1_pdmmhu.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747453/imagen11_2_krp1tj.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748314/imagen41_1_yroyu5.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748320/imagen41_2_th22py.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748201/imagen31_1_ivwegh.webp"] },
  { brand: "Honda", year: 2018, price: 22500, color: "Azul", available: true, information: "Honda Civic, bajo kilometraje, todas las revisiones al día.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747458/imagen12_1_wcsh9i.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747463/imagen12_2_cm4rns.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748327/imagen42_1_lmlkrf.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748333/imagen42_2_ne9qoa.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748216/imagen32_1_km0xv7.webp"] },
  { brand: "Ford", year: 2017, price: 23000, color: "Negro", available: true, information: "Ford Focus, perfecto para la ciudad, muy económico.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747469/imagen13_1_hiznxg.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747475/imagen13_2_a1gxr2.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748337/imagen43_1_a9ufbz.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748345/imagen43_2_ylvmag.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748224/imagen33_1_ed4qpy.webp"] },
  { brand: "Chevrolet", year: 2019, price: 25000, color: "Blanco", available: true, information: "Chevrolet Malibu, amplio y cómodo, ideal para familias.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747480/imagen14_1_gkolge.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747486/imagen14_2_npthuy.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748352/imagen44_1_cstcl3.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748356/imagen44_2_hed9sk.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748234/imagen34_1_bpnw2d.webp"] },
  { brand: "BMW", year: 2020, price: 28000, color: "Gris", available: true, information: "BMW Serie 3, lujo y potencia en un solo paquete.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747493/imagen15_1_jqmk1b.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747498/imagen15_2_mo8p0l.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748362/imagen45_1_n2c6b5.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748368/imagen45_2_eyvr24.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748245/imagen35_1_wn9ar1.webp"] },
  { brand: "Audi", year: 2016, price: 27000, color: "Verde", available: true, information: "Audi A4, diseño elegante y gran rendimiento.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747504/imagen16_1_dqwgqx.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747593/imagen16_2_lfega0.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748375/imagen46_1_xy0ef2.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748500/imagen46_2_ik9nhk.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748258/imagen36_1_ogv2fs.webp"] },
  { brand: "Mercedes", year: 2015, price: 30000, color: "Amarillo", available: true, information: "Mercedes Benz C-Class, seguridad y confort de alta gama.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747756/imagen17_1_cpqr3l.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747761/imagen17_2_npyfgp.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748851/imagen47_1_ozrzjg.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748510/imagen47_2_j2i8ju.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748272/imagen37_1_t4ui1m.webp"] },
  { brand: "Volkswagen", year: 2018, price: 24000, color: "Naranja", available: true, information: "Volkswagen Jetta, buen rendimiento de combustible.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747766/imagen18_1_ybj8ua.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747772/imagen18_2_dtp2a6.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748515/imagen48_1_k9pg6k.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746375/imagen48_2_qo6dxa.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748277/imagen38_1_t3dxtt.webp"] },
  { brand: "Nissan", year: 2017, price: 22000, color: "Plateado", available: true, information: "Nissan Altima, diseño moderno y tecnología avanzada.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747778/imagen19_1_azirdv.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747785/imagen19_2_q05zur.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746379/imagen49_1_h3furo.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746384/imagen49_2_e32sx3.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748292/imagen39_1_azhlo7.webp"] },
  { brand: "Kia", year: 2020, price: 26000, color: "Morado", available: true, information: "Kia Forte, confiable y económico, ideal para jóvenes.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747790/imagen20_1_fwakoq.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747795/imagen20_2_ewuosa.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746388/imagen50_1_wnnyce.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718746393/imagen50_2_m7uxc3.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748302/imagen40_1_aks5f7.webp"] },
  { brand: "Toyota", year: 2015, price: 20000, color: "Rojo", available: true, information: "Toyota Corolla, excelente estado, único dueño.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718747869/imagen21_1_ccvxsh.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748017/imagen21_2_u8obgy.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748201/imagen31_1_ivwegh.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748219/imagen31_2_k27eeg.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748320/imagen41_2_th22py.webp"] },
  { brand: "Honda", year: 2018, price: 22500, color: "Azul", available: true, information: "Honda Civic, bajo kilometraje, todas las revisiones al día.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748093/imagen22_1_vkbhs7.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748098/imagen22_2_ezwdr8.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748216/imagen32_1_km0xv7.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748215/imagen32_2_txgir8.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748333/imagen42_2_ne9qoa.webp"] },
  { brand: "Ford", year: 2017, price: 23000, color: "Negro", available: true, information: "Ford Focus, perfecto para la ciudad, muy económico.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748109/imagen23_1_uskrnp.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748115/imagen23_2_h4b52e.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748224/imagen33_1_ed4qpy.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748229/imagen33_2_a4mp9r.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748345/imagen43_2_ylvmag.webp"] },
  { brand: "Chevrolet", year: 2019, price: 25000, color: "Blanco", available: true, information: "Chevrolet Malibu, amplio y cómodo, ideal para familias.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748120/imagen24_1_tfvvph.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748125/imagen24_2_dbfay2.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748234/imagen34_1_bpnw2d.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748244/imagen34_2_oqklbx.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748356/imagen44_2_hed9sk.webp"] },
  { brand: "BMW", year: 2020, price: 28000, color: "Gris", available: true, information: "BMW Serie 3, lujo y potencia en un solo paquete.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748132/imagen25_1_hlavl6.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748137/imagen25_2_rfe5m7.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748245/imagen35_1_wn9ar1.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748252/imagen35_2_n35zbg.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748368/imagen45_2_eyvr24.webp"] },
  { brand: "Audi", year: 2016, price: 27000, color: "Verde", available: true, information: "Audi A4, diseño elegante y gran rendimiento.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748146/imagen26_1_sygyzi.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748148/imagen26_2_v9rgke.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748258/imagen36_1_ogv2fs.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748265/imagen36_2_miudqo.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748500/imagen46_2_ik9nhk.webp"] },
  { brand: "Mercedes", year: 2015, price: 30000, color: "Amarillo", available: true, information: "Mercedes Benz C-Class, seguridad y confort de alta gama.", photos: ["https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748154/imagen27_1_ewqksa.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748160/imagen27_2_inwolg.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748272/imagen37_1_t4ui1m.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748282/imagen37_2_oooefo.webp", "https://res.cloudinary.com/dpqwlencu/image/upload/e_background_removal/f_png/v1718748510/imagen47_2_j2i8ju.webp"] }
]

cars.each do |car_data|
  user = User.all.sample
  car = Car.new(
    brand: car_data[:brand],
    year: car_data[:year],
    price: car_data[:price],
    color: car_data[:color],
    information: car_data[:information],
    available: car_data[:available],
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
