defmodule StoreManagerSystem.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      StoreManagerSystemWeb.Telemetry,
      # Start the Ecto repository
      StoreManagerSystem.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: StoreManagerSystem.PubSub},
      # Start Finch
      {Finch, name: StoreManagerSystem.Finch},
      # Start the Endpoint (http/https)
      StoreManagerSystemWeb.Endpoint
      # Start a worker by calling: StoreManagerSystem.Worker.start_link(arg)
      # {StoreManagerSystem.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StoreManagerSystem.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    StoreManagerSystemWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
