#install.packages("shiny", dependencies = TRUE)
library(shiny)

### sudo apt-get install r-cran-ggplot2 libcairo2-dev (LINUX)
#install.packages("ggplot2", dependencies = TRUE)
library(ggplot2)

############################################################
###
### FUNCIONES AUXILIARES
###
############################################################
source("server.R")
source("ui.R")
source("pantallaEnBlanco.R")
source("dibujaDatos.R")
source("dibujaBspline.R")
source("dibujaFuncionesBase.R")

source("creaBspline.R")

source("calculaNudos.R")
source("calculaNudosUniforme.R")              # done

source("calculaPuntosControl.R")              # done
source("dame_AlfaBetaGamma.R")                # done
source("dame_LambdaDelta.R")                  # done
source("dame_X.R")                            # done

source("N.R")                                 # done
source("puntosEnCurva.R")                     # done
source("puntosEnFuncionesBase.R")             # done

source("calculaLimites.R")          # TODO - done?

############################################################

source("creaBsplineDerivada.R")     # TODO (BONUS)
source("calculaNudosNoUniforme.R")  # TODO (BONUS)

source("calculaPuntosControlDerivada.R")

source("muestraDatos.R")
source("muestraNudos.R")
source("muestraPuntosControl.R")


############################################################
###
### APLICACION
###
############################################################

shinyApp(ui, server)
