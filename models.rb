require './uploader/contents_uploader'
# Activerecordの作成
ActiveRecord::Base.establish_connection("sqlite3:db/development.db")

class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
end


class Post < ActiveRecord::Base
  mount_uploader :content, PhotoUploader
  belongs_to :user
end