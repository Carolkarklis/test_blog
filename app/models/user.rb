class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles
  has_many :comments


  def self.report_number_of_posts
    User.joins(:articles).group('users.id').having('count(articles) > 0').map do |user|
      {
        user_id: user.id,
        number_of_posts: user.articles.count
      }
    end
  end
end
