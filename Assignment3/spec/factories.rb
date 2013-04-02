Factory.define :user do |user|
  user.name                  "Benoit MIRA"
  user.email                 "benoit.mira@gmail.com"
  user.password              "mouette"
  user.password_confirmation "mouette"
end

Factory.define :item do |item|
  item.productName           "Good Item"
  item.price                 30.24
  item.urlImage              "http://www.google.com/lol"
  item.description 			 "Nice Item"
end