class Person < ApplicationRecord
  authenticates_with_sorcery!
  enum :role, { guests: 0, editor: 1, admin: 2 }, prefix: true, scopes: false
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
end
