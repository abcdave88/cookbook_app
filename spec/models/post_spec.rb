require 'rails_helper'

describe Post do

  let(:new_post) { Post.new(title: 'The Flapping Duck',
                            author: 'Jenny Talia',
                            content: 'rahrahrahrahrahrhahrahrhahrharha!',
                            date: '20150909')}
 
  it 'must have a title' do
    post = Post.new
    expect(post.valid?).to eq false 
  end

  it 'must have a author' do
    post = Post.new(title: 'Fanny Pack')
    expect(post.valid?).to eq false 
  end

  it 'must have a comment' do
    post = Post.new(title: 'Slow roasted pond alga',
                    author: 'Fanny Pack')
    expect(post.valid?).to eq false
  end

  it 'must have a date' do
    post = Post.new(title: 'Slow roasted pond alga',
                    author: 'Fanny Pack',
                    content: 'I loved you alga, great job!')  
    expect(post.valid?).to eq false
  end

  context 'no comments' do
    it 'should return a message saying no comments yet'do 
      expect(new_post.show_comments).to eq 'No comments'
    end
  end

  # context 'one comment' do
  #   it 'should return one comment' do
  #     new_post.comments << Comment.new(posted_by: 'Jenny Taylor', opinion: 'das good jahhh!')

  #     expect(new_post.show_comments).to eq 'das good jahhh!'
  #   end
  # end

  context 'multiple comments' do
    it 'should return all the comments' do
      new_post.comments << Comment.new(posted_by: 'Jenny Taylor', opinion: 'das good jahhh!')
      new_post.comments << Comment.new(posted_by: 'Jammy Taylor', opinion: 'das ok jahhh!')
      new_post.comments << Comment.new(posted_by: 'Clammy Taylor', opinion: 'das nine good jahhh!')

      expect(new_post.show_comments).to eq Comment.all

    end
  end

end


