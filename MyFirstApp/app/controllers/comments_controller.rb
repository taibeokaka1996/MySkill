class CommentsController < ApplicationController
    ##Chúng ta cũng muốn cho phép người dùng chỉ xác thực để xóa(Destroy) bình luận
    http_basic_authenticate_with name: "taibeo", password: "1234", 
    only: :destroy
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        
        redirect_to article_path(@article)
    end
    
    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy

        redirect_to article_path(@article)
    end
    private
    def comment_params
        params.required(:comment).permit(:commenter, :body)
    end
end
