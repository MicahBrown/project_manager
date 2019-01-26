module FeedsHelper
  def render_feed(feed)
    content_tag :div, class: "feed" do
      feed_content(feed) +
      feed_comments(feed) +
      feed_comment_form(feed)
    end
  end

  def feed_content(feed)
    case feed.feedable_type
    when "Comment" then
      case feed.name
      when "creation" then "Posted comment: #{simple_format(feed.feedable.message)}".html_safe
      else
        raise "implement"
      end
    when "Poll" then
      case feed.name
      when "creation" then "Posted poll: #{feed.feedable.title}".html_safe
      else
        raise "implement"
      end
    else
      raise "implement"
    end
  end

  def feed_comments(feed)
    comments = feed.comments
    return unless comments.present?

    content_tag :div do
      comments.map do |comment|
        content_tag :div, simple_format(comment.message), class: "subcomment"
      end.join.html_safe
    end
  end

  def feed_comment_form(feed)
    form_for([feed.crew, feed, Comment.new]) do |f|
      f.text_area(:message) +
      f.submit
    end
  end
end
