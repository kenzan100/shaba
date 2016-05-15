module Web::Views::Memos
  class Index
    include Web::View

    def move_up_form(memo_id, next_memo_id)
      move_form(memo_id, next_memo_id, :up)
    end

    def move_down_form(memo_id, next_memo_id)
      move_form(memo_id, next_memo_id, :down)
    end

    private

    def move_form(memo_id, next_memo_id, up_or_down)
      form_for :memo, routes.memo_path(memo_id), method: :patch do
        hidden_field :up_or_down,   value: up_or_down
        hidden_field :next_memo_id, value: next_memo_id
        submit '', class: "memoActionBox-actions-#{up_or_down}"
      end
    end
  end
end
