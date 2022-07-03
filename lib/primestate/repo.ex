defmodule Primestate.Repo do
  use Ecto.Repo,
    otp_app: :primestate,
    adapter: Ecto.Adapters.Postgres
end
