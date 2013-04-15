Factory.define :user do |user|
  user.name                  "Benoit MIRA"
  user.email                 "benoit.mira@gmail.com"
  user.password              "mouette"
  user.password_confirmation "mouette"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :micropost do |micropost|
  micropost.title "title"
  micropost.content "Foo bar"
  micropost.association :user
  micropost.tags "#lol #youpi"
end