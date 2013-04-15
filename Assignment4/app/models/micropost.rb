class Micropost < ActiveRecord::Base
  attr_accessible :content, :tags, :title

  post_regex = /\A[\w\d]+([,][\s]*[\w\d]+)*\z/i

  validates :title, :presence => true, :length => { :maximum => 75}
  validates :content, :presence => true, :length => { :maximum => 150}
  validates :tags, :format => { :with => post_regex }

end
