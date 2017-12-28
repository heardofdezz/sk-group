class User < ApplicationRecord::Base
  validates :email, presence: true
end
