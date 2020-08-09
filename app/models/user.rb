class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  validates_presence_of :name, on: :create, message: "can't be blank"
  validates_uniqueness_of :username, on: :create, message: "must be unique"
  validates_presence_of :username, on: :create, message: "can't be blank"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
