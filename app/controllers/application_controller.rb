class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_page

  def current_page
    @page ||= params[:page].blank? ? 1 : params[:page].to_i
  end

  def tag_tokens(query)
    @tags = ActsAsTaggableOn::Tag.all
    @tags = @tags.select { |v| v.name =~ /#{query}/i }
    if @tags.empty?
      [{id: "<<<#{query}>>>", name: "#{query}"}]
    else
      @tag_hash = @tags.map(&:attributes)
      # Add User added new tag too so user can select his/her new tag.
      @tag_hash << {id: "<<<#{query}>>>", name: "#{query}"} if @tags.select{ |v| v.name == query}.empty?
      return @tag_hash
    end
  end
  
end
