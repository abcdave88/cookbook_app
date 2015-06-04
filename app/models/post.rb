class Post < ActiveRecord::Base
  has_many :comments

  validates :title, presence: true
  validates :author, presence: true
  validates :content, presence: true
  validates :date, presence: true 

  def show_comments
    return 'No comments' if comments.none?
    # return self.comments.first if comments == 1
    self.comments.all
     # each do |comment|
     #   comment.first 
     # end
  end

end
