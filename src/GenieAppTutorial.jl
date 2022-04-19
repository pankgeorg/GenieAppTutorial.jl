module GenieAppTutorial

using Genie, Logging, LoggingExtras
import Sockets

println("Will initialize GenieAppTutorial")

function main()
  @info("Starting main")
  
  Core.eval(Main, :(const UserApp = $(@__MODULE__)))

  Genie.genie(; context = @__MODULE__)

  Core.eval(Main, :(const Genie = UserApp.Genie))
  Core.eval(Main, :(using Genie))
end

end
