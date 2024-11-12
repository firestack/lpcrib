defmodule LPCrib.Repo do
  use Ecto.Repo,
	otp_app: :lpcrib,
	adapter: Ecto.Adapters.Postgres
end
