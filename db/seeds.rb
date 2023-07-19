# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: "mail@1",
  password: "123456"
)

map = Map.new(
  name: "コクゴーだいへいげん"
)

map.image.attach(
  io: File.open('app/assets/images/animations/kokugo_meadow.gif'), filename: 'kokugo_meadow.gif'
)
map.save!

# enum {0 (avatar), 1 (npc), 2 (enemy), 3 (boss), 4 (effect), 5（gui)}
Actor.create!([
  {map_id: nil, name: "おとこゆうしゃ", role: 0},
  {map_id: nil, name: "おんなゆうしゃ", role: 0},
  {map_id: nil, name: "シャリカ", role: 1},
  {map_id: 1, name: "レッドドラゴン", role: 3},
  {map_id: 1, name: "スライム", role: 2},
  {map_id: 1, name: "ゴブリン", role: 2},
  {map_id: 1, name: "ウルフ", role: 2}
])

Situation.create!([
  {actor_id: 1, name: "face"},
  {actor_id: 1, name: "standing"},
  {actor_id: 1, name: "running"},
  {actor_id: 1, name: "attack"},
  {actor_id: 1, name: "deathblow"},

  {actor_id: 2, name: "face"},
  {actor_id: 2, name: "standing"},
  {actor_id: 2, name: "running"},
  {actor_id: 2, name: "attack"},
  {actor_id: 2, name: "deathblow"},

  {actor_id: 3, name: "face"},
  {actor_id: 3, name: "standing"},

  {actor_id: 4, name: "standing"},
  {actor_id: 4, name: "damaged"},

  {actor_id: 5, name: "standing"},
  {actor_id: 5, name: "damaged"},

  {actor_id: 6, name: "standing"},
  {actor_id: 6, name: "damaged"},

  {actor_id: 7, name: "standing"},
  {actor_id: 7, name: "damaged"},
])


# おとこゆうしゃ
animation = Animation.new(situation_id: 1)
animation.image.attach(io: File.open('app/assets/images/animations/yusya_otoko_face.gif'), filename: 'kokugo_meadow.gif')
animation.save!

animation = Animation.new(situation_id: 2)
animation.image.attach(io: File.open('app/assets/images/animations/yusya_otoko_standing.gif'), filename: 'kokugo_meadow.gif')
animation.save!

animation = Animation.new(situation_id: 3)
animation.image.attach(io: File.open('app/assets/images/animations/yusya_otoko_running.gif'), filename: 'kokugo_meadow.gif')
animation.save!

animation = Animation.new(situation_id: 4)
animation.image.attach(io: File.open('app/assets/images/animations/yusya_otoko_attack.gif'), filename: 'kokugo_meadow.gif')
animation.save!

animation = Animation.new(situation_id: 5)
animation.image.attach(io: File.open('app/assets/images/animations/yusya_otoko_deathblow.gif'), filename: 'kokugo_meadow.gif')
animation.save!


# おんなゆうしゃ
animation = Animation.new(situation_id: 6)
animation.image.attach(io: File.open('app/assets/images/animations/yusya_onna_face.gif'), filename: 'kokugo_meadow.gif')
animation.save!

animation = Animation.new(situation_id: 7)
animation.image.attach(io: File.open('app/assets/images/animations/yusya_onna_standing.gif'), filename: 'kokugo_meadow.gif')
animation.save!

animation = Animation.new(situation_id: 8)
animation.image.attach(io: File.open('app/assets/images/animations/yusya_onna_running.gif'), filename: 'kokugo_meadow.gif')
animation.save!

animation = Animation.new(situation_id: 9)
animation.image.attach(io: File.open('app/assets/images/animations/yusya_onna_attack.gif'), filename: 'kokugo_meadow.gif')
animation.save!

animation = Animation.new(situation_id: 10)
animation.image.attach(io: File.open('app/assets/images/animations/yusya_onna_deathblow.gif'), filename: 'kokugo_meadow.gif')
animation.save!


# シャリカ
animation = Animation.new(situation_id: 11)
animation.image.attach(io: File.open('app/assets/images/animations/shalica_face.gif'), filename: 'kokugo_meadow.gif')
animation.save!

animation = Animation.new(situation_id: 12)
animation.image.attach(io: File.open('app/assets/images/animations/shalica_standing.gif'), filename: 'kokugo_meadow.gif')
animation.save!


# レッドドラゴン
animation = Animation.new(situation_id: 13)
animation.image.attach(io: File.open('app/assets/images/animations/red_dragon_standing.gif'), filename: 'kokugo_meadow.gif')
animation.save!

animation = Animation.new(situation_id: 14)
animation.image.attach(io: File.open('app/assets/images/animations/red_dragon_damaged.gif'), filename: 'kokugo_meadow.gif')
animation.save!


# スライム
animation = Animation.new(situation_id: 15)
animation.image.attach(io: File.open('app/assets/images/animations/slime_standing.gif'), filename: 'kokugo_meadow.gif')
animation.save!

animation = Animation.new(situation_id: 16)
animation.image.attach(io: File.open('app/assets/images/animations/slime_damaged.gif'), filename: 'kokugo_meadow.gif')
animation.save!


# ゴブリン
animation = Animation.new(situation_id: 17)
animation.image.attach(io: File.open('app/assets/images/animations/goblin_standing.gif'), filename: 'kokugo_meadow.gif')
animation.save!

animation = Animation.new(situation_id: 18)
animation.image.attach(io: File.open('app/assets/images/animations/goblin_damaged.gif'), filename: 'kokugo_meadow.gif')
animation.save!


# ウルフ
animation = Animation.new(situation_id: 19)
animation.image.attach(io: File.open('app/assets/images/animations/wolf_standing.gif'), filename: 'kokugo_meadow.gif')
animation.save!

animation = Animation.new(situation_id: 20)
animation.image.attach(io: File.open('app/assets/images/animations/wolf_damaged.gif'), filename: 'kokugo_meadow.gif')
animation.save!

User.create!(
  actor_id: 1,
  name: "がくしゅうしゃ1",
  level: 1,
  study_time: 0,
  is_deleted: false,
  email: "mail@1",
  password: "123456"
)

Ability.create!([
  {user_id: 1, name: "コクゴパワー", level: 1},
  {user_id: 1, name: "サンスウスピード", level: 1},
  {user_id: 1, name: "エイゴボキャブラリ", level: 1},
  {user_id: 1, name: "シャカイカケンガク", level: 1},
  {user_id: 1, name: "インテリジェンスオブリカ", level: 1},
  {user_id: 1, name: "ソノタノキョウカ", level: 1},
])