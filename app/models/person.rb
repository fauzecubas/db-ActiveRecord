class Person < ActiveRecord::Base
    has_one :profile, dependent: :destroy
    has_many :posts, dependent: :destroy
  end
  