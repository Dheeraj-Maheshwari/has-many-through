class User < ApplicationRecord
	has_many :buses, dependent: :destroy
	accepts_nested_attributes_for :buses, :allow_destroy => true
end
