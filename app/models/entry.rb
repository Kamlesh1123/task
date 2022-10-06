class Entry < ActiveRecord::Base
has_one_attached :image
has_many :likes, dependent: :destroy
has_many :comments, dependent: :destroy
end