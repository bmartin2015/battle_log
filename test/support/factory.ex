defmodule BattleLog.Factory do
  use ExMachina.Ecto, repo: BattleLog.Repo

  def user_factory do
    %BattleLog.User{
      token: "ffnebyt73bich9",
      email: "batman@example.com",
      first_name: "Bruce",
      last_name: "Wayne",
      provider: "google"
    }
  end
end