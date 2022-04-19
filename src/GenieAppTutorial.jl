module GenieAppTutorial

using Genie, Logging, LoggingExtras
import Sockets

function main()
  Core.eval(Main, :(const UserApp = $(@__MODULE__)))

  # Genie.genie(; context = @__MODULE__)

  Genie.load(context = @__MODULE__)
  server = Sockets.listen(parse(Sockets.IPAddr, get(ENV, "HOST", "0.0.0.0")), parse(Int, get(ENV, "PORT", "8000")))
  println("\n\n\nWill run Genie\n\n\n")
  Genie.run(; server = server)
  # Nothing will run from here on
  println("\n\n\nGenie.run initiated\n\n\n")
  Core.eval(Main, :(const Genie = UserApp.Genie))
  Core.eval(Main, :(using Genie))
end

end
