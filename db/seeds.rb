# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 5章のRoomモデルに対するシード
=begin 30.times do |n|
  Room.create!(
    name: "5章test#{n}",
    place: "5章test#{n}",
    number: 10,
    terms_of_use: "5章testで新しく追加した属性"
  )
end
=end puts "30件データ登録完了"

# 6章のEntryモデルに対するシード
=begin 20.times do |n|
  date = Time.now + n.days
  Entry.create!(
    user_name: "ABC#{n}",
    user_email: "abc#{n}@sample.com",
    reserved_date: date,
    usage_time: 5,
    room_id: 1,
    people: 10
  )
end
puts "20件データ登録完了"
=end

#管理者権限のユーザを登録
user = User.create!(
  name: "admin3",
  email: "admin3@sample.com",
  password: "admin3",
  admin: true
)
puts  "管理者作成完了"
