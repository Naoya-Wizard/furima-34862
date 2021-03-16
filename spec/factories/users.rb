FactoryBot.define do
    factory :user do
      nickname              {'furimatarou'}
      email                 {'test@example'}
      password              {'a11111'}
      password_confirmation {password}
      last_name             {'山田'}
      first_name            {'太郎'}
      last_name_ruby        {'ヤマダ'}
      first_name_ruby       {'タロウ'}
      birthday              {'20201030'}
    end
  end
