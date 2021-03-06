module SlashCommandsHelpers
  def write_note(text)
    Sidekiq::Testing.fake! do
      page.within('.js-main-target-form') do
        fill_in 'note[note]', with: text
        find('.comment-btn').trigger('click')
      end
    end
  end
end
