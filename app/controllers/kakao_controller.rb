class KakaoController < ApplicationController
  def index
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
    @posts = Post.all.order(created_at: :desc) #최신글이 가장 상단에 노출
    @comments = Comment.all.order(created_at: :desc) #최신글이 가장 상단에 노출
    
  end
  
  def send_msg
    post = Post.create(content: params[:content], user_id: params[:user_id])
    post.save
    
    unless params[:content].blank?
      Pusher.trigger('test_channel', 'my_event', {
        content: post.content,
        id: post.id,
        writer: post.user.name,
        school: post.user.school,
      })
    render :text => ""
    else
    redirect_to '/', notice: "내용이 없습니다!"
    end
  end
  
  def send_comment
    comment = Comment.create(content: params[:content], user_id: params[:user_id],
                            post_id: params[:post_id])
    comment.save
    
    unless params[:content].blank?
      Pusher.trigger('test_channel2', 'my_event2', {
        content: comment.content,
        writer: comment.user.name,
        school: comment.user.school,
        id: comment.id,
        post_id: comment.post.id
      })
    render :text => ""
    else
    redirect_to '/', notice: "내용이 없습니다!"
    end
    
  end
  
  def comment_delete
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to '/'
  end
  
  
end
