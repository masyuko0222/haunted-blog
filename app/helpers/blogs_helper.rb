# frozen_string_literal: true

module BlogsHelper
  def format_content(blog)
    # https://qiita.com/mmaumtjgj/items/1b672f3accd37387b2f3#h%E3%82%AA%E3%83%97%E3%82%B7%E3%83%A7%E3%83%B3
    simple_format(h(blog.content))
  end
end
