class Verb < ApplicationRecord
  validates :infinitive, presence: true, uniqueness: true
  validates :simple_past, :past_participle, :translation, presence: true
end
