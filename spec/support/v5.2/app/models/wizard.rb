# typed: strict
class Wizard < ApplicationRecord
  validates :name, length: { minimum: 5 }, presence: true

  typed_enum house: {
    Gryffindor: 0,
    Hufflepuff: 1,
    Ravenclaw: 2,
    Slytherin: 3,
  }

  enum professor: {
    "Severus Snape": 0,
    "Minerva McGonagall": 1,
    "Pomona Sprout": 2,
    "Filius Flitwick": 3,
    "Hagrid": 4,
  }

  typed_enum broom: {
    nimbus: 'nimbus',
    firebolt: 'firebolt',
  }, _prefix: true

  typed_enum quidditch_position: {
    keeper: 0,
    seeker: 1,
    beater: 2,
    chaser: 3,
  }, _prefix: :quidditch

  enum hair_color: {
    brown: 0,
    black: 1,
    blonde: 2,
  }, _suffix: :hair

  enum eye_color: {
    brown: 0,
    green: 1,
    blue: 2,
  }, _prefix: :color, _suffix: :eyes

  has_one :wand
  has_many :spell_books

  # simulate when belongs_to is optional by default
  belongs_to :school, optional: true

  scope :recent, -> { where('created_at > ?', 1.month.ago) }
  has_one_attached :school_photo
  has_many_attached :hats
end
