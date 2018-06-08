class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories

  ratyrate_rateable "rating", "quality", "original_score"
  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :content, presence: true
  validates :original_name, presence: true
  validates :time, presence: true
  validates :nation, presence: true
  validates :image, presence: true
  validates :year, numericality: {greater_than_or_equal_to: 1950, only_integer: true }

  scope :load_info_home, -> {
    select("id, title, image, year, view")
  }

  scope :load_info_new, -> {
    select("id, title, content, original_name, image, year, view, user_id")
  }

  scope :load_info_post_new, -> {
    select("id, title, original_name, image, view, user_id")
  }

  scope :all_except, ->(post_id) {where.not(id: post_id)}

  def category_name
    categories.pluck(:name).join ", "
  end
end
