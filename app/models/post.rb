class Post < ApplicationRecord
  has_many :comments, class_name: "Comment"
end
