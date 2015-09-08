class User < ActiveRecord::Base
  #defines who the leaders are
  has_many :subscriptions, foreign_key :follower_id, dependent: :destroy
  
  has_many :leaders, through: :subscriptions
  
  #defines who the followers are
  has_many :reverse_subscriptions, foreign_key: :leader_id, class_name: 'Subscription', dependent: :destroy
  
  has_many :followers, through: :reverse_subscriptions
  
  #defines associations for the posts types
  has_many :posts, dependent: :destroy
  has_many :text_posts, dependent: :destroy
  has_many :image_posts, dependent: :destroy
  
  #define associations for comments
  has_many :comments, dependent: :destroy
  
  
  def following?(leader)
    leaders.include? leader
  end
  
  def follow!(leader)
    if leader != self && !following?(leader)
      leaders << leader
    end
  end
  
end
