class Heroine < ApplicationRecord
    has_one :power
    validates :name, presence: true, uniqueness: true 
end
