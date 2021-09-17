#coding:UTF-8
AdminUser.new(
  name: '管理者 太郎',
  role: 'owner',
  email: 'taro@example.co.jp',
  password: 'Taro01',
).save

AdminUser.new(
  name: '管理者 次郎',
  role: 'staff',
  email: 'jiro@example.co.jp',
  password: 'Jiro01',
).save

30.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email

  AdminUser.new(
    name: name,
    role: 'staff',
    email: email,
    password: "Admin#{n}",
  ).save
end

categories_list = %w(棚 収納 テレビ台 ベッド 机 照明 椅子 タンス ソファ クッション その他)
categories_list.each do |category|
  Category.new(
    name: category,
  ).save
end
