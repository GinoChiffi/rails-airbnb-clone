class Item < ApplicationRecord
  belongs_to :user
  belongs_to :brand
  has_many :item_likes
  has_one :order
  has_many :colors, through: :item_colors
  has_many :sizes, through: :item_sizes
  has_many :subcategories, through: :item_subcategories

  validates :name, presence: true
  validates :price, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :description, presence: true
  validates :gender, presence: true
  validates :user_id, presence: true
  validates :brand_id, presence: true

  def self.search(search)
    if search.present?
      where("name LIKE ?", "%#{search}%")
      where("gender LIKE ?", "%#{search}%")
    else
      unscoped
    end

  end

end
