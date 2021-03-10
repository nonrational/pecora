defmodule Pecora.Repo do
  use Ecto.Repo,
    otp_app: :pecora,
    adapter: Ecto.Adapters.Postgres
end
