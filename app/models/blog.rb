# frozen_string_literal: true

class Blog < ApplicationRecord
  belongs_to :user
  has_many :likings, dependent: :destroy
  has_many :liking_users, class_name: 'User', source: :user, through: :likings

  validates :title, :content, presence: true

  scope :published, -> { where('secret = FALSE') }

  scope :search, lambda { |term|
    # Sanitizes a string so that it is safe to use within an SQL LIKE statement. This method uses escape_character to escape all occurrences of itself, “_” and “%”.
    term = "%#{ActiveRecord::Base.sanitize_sql_like(term.to_s)}%"
    where("title LIKE ? OR content LIKE ?", term, term)
  }

  scope :default_order, -> { order(id: :desc) }

  def owned_by?(target_user)
    user == target_user
  end
end
