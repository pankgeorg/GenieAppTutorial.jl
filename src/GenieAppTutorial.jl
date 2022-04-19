module GenieAppTutorial

using Genie, Logging, LoggingExtras
import Sockets

println("Will initialize GenieAppTutorial")

function main()
  @info("Starting main")
  # Genie.genie(; context = @__MODULE__)
  Genie.load(context = @__MODULE__)
  @info("Loaded context")
  try
    server = Sockets.listen(parse(Sockets.IPAddr, get(ENV, "HOST", "0.0.0.0")), parse(Int, get(ENV, "PORT", "8000")))
    @info("\n\n\nWill run Genie\n\n\n")
    Genie.run(; server = server)
  catch ex
    @info "what?" (ex, catch_backtrace())
    Genie.run(; server=Sockets.listen(parse(Sockets.IPAddr, get(ENV, "HOST", "127.0.0.1")), parse(Int, get(ENV, "PORT", "8000"))))
  end
end

end
