using Genie, Stipple, StippleUI, StipplePlotly
using Genie.Router, Genie.Renderer.Html
using DashboardsController


for m in [Genie, Stipple, StippleUI, StipplePlotly]
  m.assets_config.host = "https://cdn.statically.io/gh/GenieFramework"
end


route("/") do
  html(:dashboards, "dashboards.jl"; layout=:app, context = DashboardsController, DashboardsController.render()...)
end

route("/api", context = DashboardsController, DashboardsController.API.api)