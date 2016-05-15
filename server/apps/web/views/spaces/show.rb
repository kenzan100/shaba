module Web::Views::Spaces
  class Show
    include Web::View

    def insert_above_link(memo)
      insert_link(memo, :above)
    end

    def insert_below_link(memo)
      insert_link(memo, :below)
    end

    def move_up_form(memo, next_memo)
      move_form(memo, next_memo, :up)
    end

    def move_down_form(memo, next_memo)
      move_form(memo, next_memo, :down)
    end

    private

    def insert_link(memo, above_or_below)
      option = { below: { up_or_down: :down },
                 above: { up_or_down: :up   } }[above_or_below]
      option.merge!(next_memo_id: memo.id)
      link_to '', routes.new_memo_path(option), class: "memoHR-actions-insert"
    end

    def move_form(memo, next_memo, up_or_down)
      return unless memo && next_memo
      form_for :memo, routes.memo_path(memo.id), method: :patch do
        hidden_field :up_or_down,   value: up_or_down
        hidden_field :next_memo_id, value: next_memo.id
        submit '', class: "memoActionBox-actions-#{up_or_down}"
      end
    end
  end
end
