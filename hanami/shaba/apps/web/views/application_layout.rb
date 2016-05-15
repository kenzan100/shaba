module Web
  module Views
    class ApplicationLayout
      include Web::Layout

      def navigation_links
        [
          link_to('Write New', routes.new_memo_path),
          link_to('Memos', routes.memos_path),
          link_to('Posts', routes.space_path(:posts))
        ]
      end
    end
  end
end
