module GenieAppTutorial

using Genie, Logging, LoggingExtras
import Sockets

@info("Will initialize GenieAppTutorial")

function main()
  @info("Starting main")
  # Genie.genie(; context = @__MODULE__)
  Genie.load(context = @__MODULE__)
  server = Sockets.listen(parse(Sockets.IPAddr, get(ENV, "HOST", "0.0.0.0")), parse(Int, get(ENV, "PORT", "8000")))
  @info("\n\n\nWill run Genie\n\n\n")
  Genie.run(; server = server)
end

end
