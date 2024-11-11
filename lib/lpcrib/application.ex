defmodule LPCrib.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LPCribWeb.Telemetry,
      LPCrib.Repo,
      {DNSCluster, query: Application.get_env(:lpcrib, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: LPCrib.PubSub},
      # Start a worker by calling: LPCrib.Worker.start_link(arg)
      # {LPCrib.Worker, arg},
      # Start to serve requests, typically the last entry
      LPCribWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LPCrib.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LPCribWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
