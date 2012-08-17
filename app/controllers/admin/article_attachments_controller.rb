class Admin::ArticleAttachmentsController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :check_admin_verification!
  
  def create
    @article = Article.find(params[:article_id])
    @article_attachment = @article.article_attachments.build(params[:article_attachment])
    unless @article.save
      flash[:error] = 'Attachment Title is required'
    end
    redirect_to edit_admin_article_path(@article)
    
  end

  def destroy
    @article_attachment = ArticleAttachment.find(params[:id])
    @article = @article_attachment.article
    if @article_attachment.destroy
      flash[:notice] = 'File Removed'
    else
      flash[:error] = 'Photo could not be deleted'
    end
    redirect_to edit_admin_article_path(@article)
  end

  def update
    @article_attachment = ArticleAttachment.find(params[:id])
    @article = Article.find(params[:article_id])
    if @article_attachment.update_attributes(params[:article_attachment])
      flash[:notice] = "Attachment updated!"
      redirect_to edit_admin_article_path(@article)
    else      
      flash[:error] = 'You are missing information'
      render 'edit'
    end
  end

end