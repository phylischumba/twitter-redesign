class User < ApplicationRecord
  has_many :reviews, foreign_key: 'author_id', class_name: 'Review'
end
